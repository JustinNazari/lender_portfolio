class PaymentScheduler

  def self.expected_schedule(loan)
    schedule = []
    amount = loan.amount.to_f
    amount_paid = loan.amount_paid.to_f
    tenor = loan.campaign.tenor
    irr = loan.campaign.irr.to_f
    origination_date = loan.campaign.date.to_date
    grace_period = loan.campaign.grace_period
    start_date = origination_date.next_month(grace_period)
    total_due = amount * (1 + (irr/100)).round(2) 
    amount_due = (total_due/tenor).round(2)

    payments = []

    loan.payments.each do |payment|
      payments.push(payment)
    end
    payment_diff = 0
    for i in 1..tenor
      
      entry = {payment_period: i, due_date: origination_date.next_month(grace_period + i), amount_due: amount_due}
      entry[:payments] = []
      due_date = entry[:due_date]
      entry_payments_sum = 0
      
      entry_payments = payments.select do |payment|
          payment.date.to_date < due_date
      end

      entry_payments.each do |payment|
        entry_payments_sum += payment.amount_paid
      end

      if entry_payments_sum < amount_due && due_date < Date.current
        entry[:late] = true
      end

      remaining = amount_due

      payments.each do |payment|
        if ((remaining + payment_diff) - payment.amount_paid) > 0
          remainaing = remaining - payment.amount_paid
          entry[:payments].push(payments.shift)
        else
          payment.amount_paid -= remaining
          break
        end
      end

      payment_diff = amount_due - entry_payments_sum 
      
      if amount_paid - amount_due >= 0
        entry[:amount_paid] = amount_due
        entry[:paid] = true
        amount_paid -= amount_due
      else
        entry[:amount_paid] = amount_paid
        amount_paid = 0.00
      end
      schedule.push(entry)      
    end
    schedule
  end

  def self.late_payments(loan)
    all_payments = loan.payments
    late_payments = {}
    schedule = loan.schedule
    less_than_ten_days_late = []
    up_to_twenty_days_late = []
    more_than_twenty_days_late = []
    

    schedule.each do |entry| 
      if entry[:late] && entry[:paid]
        if (entry[:due_date] + 10) > entry[:payments].last.date
          less_than_ten_days_late.push(entry)
        elsif (entry[:due_date] + 20) > entry[:payments].last.date
          more_than_twenty_days_late.push(entry)
        elsif (entry[:due_date] + 20) < entry[:payments].last.date
          more_than_twenty_days_late.push(entry)
        end
      elsif entry[:late]
        if (Date.current - 10) < entry[:due_date]
          less_than_ten_days_late.push(entry)
        elsif (Date.current - 20) < entry[:due_date]
          up_to_twenty_days_late.push(entry)
        else
          more_than_twenty_days_late.push(entry)
        end
      end
    end
    late_payments[:less_than_ten_days_late] = less_than_ten_days_late.count
    late_payments[:up_to_twenty_days_late] = up_to_twenty_days_late.count
    late_payments[:more_than_twenty_days_late] = more_than_twenty_days_late.count
    late_payments  
  end

end
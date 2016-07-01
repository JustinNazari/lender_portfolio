class Loan < ApplicationRecord
  belongs_to :campaign
  belongs_to :investor, class_name: "User"
  has_many :payments

  def amount_paid
    payments = self.payments
    amount_paid = 0
    payments.each do |payment|
      amount_paid += payment.amount_paid
    end
    amount_paid
  end

  def schedule
    scheduled_payments = PaymentScheduler.expected_schedule(self)
  end

  def late_payments
    late_payments = PaymentScheduler.late_payments(self) 
  end


end

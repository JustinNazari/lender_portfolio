# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(name: "Justin Nazari")

campaign1 = Campaign.create(grace_period: 0, date: (Date.current.to_date.prev_month(2)), description: "Campaign #1", amount: 5000, irr: 4, tenor: 10)
campaign2 = Campaign.create(grace_period: 0, date: (Date.current.to_date.prev_month(6)), description: "Campaign #2", amount: 10000, irr: 8, tenor: 10)
campaign3 = Campaign.create(grace_period: 0, date: (Date.current.to_date.prev_month(18)), description: "Campaign #3", amount: 15000, irr: 9, tenor: 10)
campaign4 = Campaign.create(grace_period: 0, date: (Date.current.to_date.prev_month(24)), description: "Campaign #4", amount: 75000, irr: 11, tenor: 10)
campaign5 = Campaign.create(grace_period: 0, date: (Date.current.to_date.prev_month(36)), description: "Campaign #5", amount: 4000, irr: 12, tenor: 10)

loan1 = Loan.create(investor: user, campaign: campaign1, amount: 500)
loan2 = Loan.create(investor: user, campaign: campaign2, amount: 1000)
loan3 = Loan.create(investor: user, campaign: campaign3, amount: 1500)
loan4 = Loan.create(investor: user, campaign: campaign4, amount: 2000)
loan5 = Loan.create(investor: user, campaign: campaign5, amount: 2500)

loan1_payment1 = Payment.create(loan: loan1, date: Date.current.to_date, amount_paid: 50)
loan1_payment2 = Payment.create(loan: loan1, date: Date.current.to_date, amount_paid: 54)

loan2_payment1 = Payment.create(loan: loan2, date: Date.current.to_date.prev_month(5), amount_paid: 108)
loan2_payment2 = Payment.create(loan: loan2, date: Date.current.to_date.prev_month(4), amount_paid: 100)
loan2_payment3 = Payment.create(loan: loan2, date: Date.current.to_date.prev_month(3), amount_paid: 116)
loan2_payment4 = Payment.create(loan: loan2, date: Date.current.to_date.prev_month(2), amount_paid: 108)
loan2_payment5 = Payment.create(loan: loan2, date: Date.current.to_date.prev_month(1), amount_paid: 108)

loan3_payment1 = Payment.create(loan: loan3, date: Date.current.to_date.prev_month(8), amount_paid: 1500)

loan4_payment1 = Payment.create(loan: loan4, date: Date.current.to_date.prev_month(, amount_paid: 108)

loan5_payment1 = Payment.create(loan: loan5, date: Date.current.to_date, amount_paid: 108)

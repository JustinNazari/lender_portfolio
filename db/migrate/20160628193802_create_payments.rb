class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :loan_id
      t.datetime :due_date
      t.float :amount_due
      t.float :amount_paid
      t.integer :payment_period
      t.timestamps
    end
  end
end

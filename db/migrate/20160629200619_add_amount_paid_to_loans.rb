class AddAmountPaidToLoans < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :amount_paid, :float
  end
end

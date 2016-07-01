class AddPaidAndLateToLoans < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :paid, :boolean
    add_column :loans, :late, :boolean
  end
end

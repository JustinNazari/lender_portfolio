class ChangePaymentsDueDateToDate < ActiveRecord::Migration[5.0]
  def change
    rename_column :payments, :due_date, :date
  end
end

class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.integer :investor_id
      t.integer :campaign_id
      t.integer :amount
      t.timestamps
    end
  end
end

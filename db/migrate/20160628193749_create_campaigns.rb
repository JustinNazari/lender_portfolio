class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.integer :borrower_id
      t.integer :grace_period
      t.datetime :date
      t.string :description
      t.integer :amount
      t.integer :irr
      t.timestamps
    end
  end
end

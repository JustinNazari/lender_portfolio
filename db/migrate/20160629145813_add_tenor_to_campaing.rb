class AddTenorToCampaing < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :tenor, :integer
  end
end

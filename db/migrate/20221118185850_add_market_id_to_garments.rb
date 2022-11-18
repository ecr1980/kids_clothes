class AddMarketIdToGarments < ActiveRecord::Migration[7.0]
  def change
    add_column :garments, :market_id, :integer
  end
end

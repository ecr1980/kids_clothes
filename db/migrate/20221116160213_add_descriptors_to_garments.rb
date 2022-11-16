class AddDescriptorsToGarments < ActiveRecord::Migration[7.0]
  def change
    add_column :garments, :type, :string
    add_column :garments, :subtype, :string
    add_column :garments, :size, :string
    add_column :garments, :color, :string
    add_column :garments, :season, :string
    add_column :garments, :on_market, :boolean
    add_column :garments, :price, :float
  end
end

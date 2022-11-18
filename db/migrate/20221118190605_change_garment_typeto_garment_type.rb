class ChangeGarmentTypetoGarmentType < ActiveRecord::Migration[7.0]
  def change
    rename_column :garments, :type, :clothing_catagory
    rename_column :garments, :subtype, :clothing_catagory_item
  end
end

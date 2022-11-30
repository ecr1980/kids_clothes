class AddHoodiestoChildren < ActiveRecord::Migration[7.0]
  def change
    remove_column :children, :rain_boot_need
    remove_column :children, :rain_boot_size
    remove_column :children, :boot_need
    remove_column :children, :boot_size
    remove_column :children, :snow_boot_need
    remove_column :children, :snow_boot_size

    add_column :children, :hoodie_need, :integer
    add_column :children, :hoodie_size, :integer
    add_column :children, :rain_boots_need, :integer
    add_column :children, :rain_boots_size, :integer
    add_column :children, :boots_need, :integer
    add_column :children, :boots_size, :integer
    add_column :children, :snow_boots_need, :integer
    add_column :children, :snow_boots_size, :integer

  end
end

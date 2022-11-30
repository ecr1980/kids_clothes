class AddItemstoChildren < ActiveRecord::Migration[7.0]
  def change
    remove_column :children, :non_jean_pants_need
    remove_column :children, :non_jean_pants_size
    remove_column :children, :socks_need
    remove_column :children, :socks_size
    remove_column :children, :underwear_need
    remove_column :children, :underwear_size

    add_column :children, :dress_pants_need, :integer
    add_column :children, :dress_pants_size, :integer
    add_column :children, :sweatpants_need, :integer
    add_column :children, :sweatpants_size, :integer
    add_column :children, :leggings_need, :integer
    add_column :children, :leggings_size, :integer
    add_column :children, :low_cut_socks_need, :integer
    add_column :children, :low_cut_socks_size, :integer
    add_column :children, :high_cut_socks_need, :integer
    add_column :children, :high_cut_socks_size, :integer
    add_column :children, :boys_underwear_need, :integer
    add_column :children, :boys_underwear_size, :integer
    add_column :children, :girls_underwear_need, :integer
    add_column :children, :girls_underwear_size, :integer
    add_column :children, :sandals_need, :integer
    add_column :children, :sandals_size, :integer
    add_column :children, :flip_flops_need, :integer
    add_column :children, :flip_flops_size, :integer
  end
end

class AddSweaterstoChildren < ActiveRecord::Migration[7.0]
  def change
    add_column :children, :sweater_need, :integer
    add_column :children, :sweater_size, :integer
    add_column :children, :sweatshirt_need, :integer
    add_column :children, :sweatshirt_size, :integer
  end
end

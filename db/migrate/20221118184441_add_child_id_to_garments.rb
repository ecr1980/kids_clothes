class AddChildIdToGarments < ActiveRecord::Migration[7.0]
  def change
    add_column :garments, :child_id, :integer
  end
end

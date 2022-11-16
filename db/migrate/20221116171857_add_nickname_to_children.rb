class AddNicknameToChildren < ActiveRecord::Migration[7.0]
  def change
    add_column :children, :nickname, :string
  end
end

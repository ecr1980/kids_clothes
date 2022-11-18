class CreateUserChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :user_children do |t|
      t.belongs_to :child
      t.belongs_to :user
      t.timestamps
    end
  end
end

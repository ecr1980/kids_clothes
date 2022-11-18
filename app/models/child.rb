class Child < ApplicationRecord
  has_one_attached :avatar
  has_many :garments
  has_many :user_children
  has_many :users, through: :user_children
end

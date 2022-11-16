class Child < ApplicationRecord
  has_one_attached :avatar
  has_many :garments
  has_and_belongs_to_many :users
end

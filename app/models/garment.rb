class Garment < ApplicationRecord
  belongs_to :child
  belongs_to :market
  has_one_attached :photo
end

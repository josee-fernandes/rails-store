class Product < ApplicationRecord
  validates :price, presence: true
  validates :name, length: { minimum: 4 }
end

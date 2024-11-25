class Product < ApplicationRecord
  belongs_to :department

  validates :price, presence: true
  validates :name, length: { minimum: 4 }
end

class Product < ApplicationRecord
  belongs_to :department, optional: true

  validates :price, :department, presence: true
  validates :name, length: { minimum: 4 }
end

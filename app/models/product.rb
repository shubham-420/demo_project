class Product < ApplicationRecord
  validates :name, :description, length: { minimum: 2 }	
  validates :price, :tax, numericality: { only_integer: true }	
  belongs_to :user
  belongs_to :category
  has_one_attached :image
end

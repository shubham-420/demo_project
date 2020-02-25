class Order < ApplicationRecord
  has_many :order_items
  belongs_to :location, optional: true
  belongs_to :user
  
end

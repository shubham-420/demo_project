class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  after_save :update_total
  after_destroy :update_total

  def update_total
    total = 0
    order.order_items.each do|item|
      total = total + (item.price * item.quantity)
    end
    order.update(total: total)
  end

end

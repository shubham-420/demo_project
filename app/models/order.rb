class Order < ApplicationRecord
  has_many :order_items
  belongs_to :location, optional: true
  belongs_to :user

  after_update :send_mail

  def send_mail
    @order = Order.find(id)
    hash = Hash.new

    if @order.status == 'done'
      order_items = @order.order_items
      order_items.each do |item|
        hash[item.user.id] = [] unless hash[item.user.id].present?
        hash[item.user.id] << item.product_id
      end
      hash.each do |user_id, product_id|
        OrderMailer.with(order: @order, user_id: user_id, products: product_id).seller_order_email.deliver_later
      end
    end
  end
        # binding.pry

  # def status_not_pending?
  #   binding.pry
  #   return false
  # end

end

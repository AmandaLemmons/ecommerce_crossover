class CartsController < ApplicationController
  def show
    @order_lines = current_order.order_lines
    order_id = @order_lines.first.order_id
    order = Order.where(id: order_id).first
    @customer = Customer.where(id: order.customer_id).first
  end
end

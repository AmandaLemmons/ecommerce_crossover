class OrdersController < ApplicationController

  def new
    @order = Order.new
    @product = Product.find(params[:id])
    @order_lines = OrderLine.find(product_id: @product.id)
  end

  def create
    order = Order.new(order_params)
  end


  private

  def order_params
    params.require(:order).permit(:order_no, :customer_id, :total, :date)
  end
end

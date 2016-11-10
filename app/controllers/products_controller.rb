class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order_line = current_order.order_lines.new

  end

  def add_to_cart
    @product = Product.find(params[:id])
  end
end

class OrderLinesController < ApplicationController

  def new
    @orderline = OrderLine.new
    @product = Product.find(params[:id])

  end

  def create
    orderline = OrderLine.new(order_line_params)
    product = Product.find(params[:order_line][:product_id])
    orderline.product_id = product.id
    orderline.unit_price = product.price
    orderline.total_price = orderline.qty * orderline.unit_price

    if orderline.save
      redirect_to root_path
    else
      render :index
    end
    end

  private
  def order_line_params
    params.require(:order_line).permit(:product_id, :qty, :order_id, :unit_price, :total_price)




  end
end

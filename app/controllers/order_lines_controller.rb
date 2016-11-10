class OrderLinesController < ApplicationController
  # before_action :authenticate_customer!
  def create
    @order = current_order
    @order_line = @order.order_lines.new(order_line_params)
    @order.customer_id = current_customer.id
    @order.date = Date.today
    @order.save

    session[:order_id] = @order.id
  end



 def update
   @order = current_order
   @order_line = @order.order_lines.find(params[:id])
   @order_line.update_attributes(order_line_params)
   @order_lines = @order.order_lines
 end

 def destroy
   @order = current_order
   @order_line = @order.order_lines.find(params[:id])
   @order_line.destroy
   @order_lines = @order.order_lines
 end

  # def new
  #   @orderline = OrderLine.new
  #   @product = Product.find(params[:id])
  #
  # end
  #
  # def create
  #   orderline = OrderLine.new(order_line_params)
  #   product = Product.find(params[:order_line][:product_id])
  #   orderline.product_id = product.id
  #   orderline.unit_price = product.price
  #   orderline.total_price = orderline.qty * orderline.unit_price
  #
  #   if orderline.save
  #     redirect_to root_path
  #   else
  #     render :index
  #   end
  # end
  #
  # def view_cart
  #   @order_lines = Orderline.find(custparams[:id])
  # end
  #
  private
  def order_line_params
    params.require(:order_line).permit(:product_id, :qty, :order_id, :unit_price, :total_price)
  end
  # def current_user_cart
  #   "cart#{current_customer.id}"
  # end
end

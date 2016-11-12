class OrderLinesController < ApplicationController

  def new
    @orderline = OrderLine.new
    @product = Product.find(params[:id])
    session[:order_id] = @order.id
  end

  def create
    @order = current_order
    @order_line = @order.order_lines.new(order_line_params)
    @order.customer_id = current_customer.id
    @order.date = Date.today
    @order.status = 0
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


  private
    def order_line_params
      params.require(:order_line).permit(:product_id, :qty, :order_id, :unit_price, :total_price)
    end

end

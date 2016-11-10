class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  # def current_order
  #   Order.where(customer_id: current_customer.id)
  #
  # end


  def current_order
    # Order.where('customer_id =?', current_customer.id).where(order_no: "cart")
    # binding.pry
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end

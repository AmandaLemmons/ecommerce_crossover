class ChargesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @charges = JSON.parse Http.headers("x-api-key" => "91d994652a17").get("https://git.heroku.com/salty-hamlet-58993/charges.json")
  end

  def new
    @order = Order.find(params[:order_id])
    @customer = Customer.find(params[:customer_id])
  end

  def create
    @order = Order.find(params[:order_id])
    product_id = current_order.order_lines.pluck(:product_id)
    @product_name = Product.find(product_id).first.name
    customer_id = current_customer.id
    response = Http.post("https://git.heroku.com/salty-hamlet-58993/charges.json", json: {charge:{email: params[:charge][:email], amount: params[:charge][:amount], card_number: params[:charge][:card_number], cvc: params[:charge][:cvc], exp_month: params[:charge][:exp_month], exp_year: params[:charge][:exp_year], name: params[:charge][:name], customer_id: params[:charge][:customer_id], product_name: params[:charge][:product_name], date: params[:charge][:date]}})

    charge = JSON.parse(response)
    session[:email] = charge["email"]
    session[:name] = charge["name"]
    @charge = session[:charge]
    redirect_to my_orders_path
  end

  def my_orders
    customer_id = current_customer.id
    @orders = JSON.parse Http.headers("x-api-key" => "91d994652a17").get("https://git.heroku.com/salty-hamlet-58993/charges/#{customer_id}.json")
  end

end

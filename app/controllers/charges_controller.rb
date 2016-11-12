class ChargesController < ApplicationController

  def index
    @charges = JSON.parse Http.headers("x-api-key" => "91d994652a17").get("http://localhost:3000/charges.json")
  end

  def new
    @order = Order.find(params[:order_id])
    @customer = Customer.find(params[:customer_id])
  end

  def create
    @order = Order.find(params[:order_id])

    response = Http.post("http://localhost:3000/charges.json", json: {charge:{email: params[:charge][:email], amount: params[:charge][:amount], card_number: params[:charge][:card_number], cvc: params[:charge][:cvc], exp_month: params[:charge][:exp_month], exp_year: params[:charge][:exp_year],name: params[:charge][:name]}})

    charge = JSON.parse(response)
    session[:email] = charge["email"]
    session[:name] = charge["name"]
    @charge = session[:charge]
    if @charge.save
      @order.status = 1
    else
      @order.status = 2
    end
    redirect_to orders_path
  end

  private
  # def update_order_number
  #   current_order.order_no = "2"
  # end
end

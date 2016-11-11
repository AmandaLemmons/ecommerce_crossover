class ChargesController < ApplicationController

  def index
    @charges = JSON.parse Http.headers("x-api-key" => "91d994652a17").get("http://localhost:3000/charges.json")
  end

  def new
    @order = Order.find(params[:id])
    @customer = Customer.where(id: @order.customer_id)
  end

  def create
    response = Http.post("http://localhost:3000/charges.json", json: {charge:{email: params[:charge][:email], amount: params[:charge][:amount], card_number: params[:charge][:card_number], cvc: params[:charge][:cvc], exp_month: params[:charge][:exp_month], name: params[:charge][:name]}})

    charge = JSON.parse(response)
    session[:email] = charge["email"]
    session[:name] = charge["name"]
    @charge = session[:charge]

  end
end

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def add_to_cart
    @product = Product.find(params[:id])
    
  end
end

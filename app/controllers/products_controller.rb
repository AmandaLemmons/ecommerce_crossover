class ProductsController < ApplicationController
  before_action :set_product,  only:[:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    @order_line = current_order.order_lines.new
  end

  def add_to_cart
    # @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to cart_path, notice: 'product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
    # @order_item = current_order.order_items.new

  end

  def edit
  end

  def update
    respond_to do |format|
    if @product.update(product_params)
      format.html { redirect_to root_path, notice: 'product was successfully updated.' }
      format.json { render :show, status: :ok, location: @product }
    else
      format.html { render :edit }
      format.json { render json: @product.errors, status: :unprocessable_entity }
    end
  end
  end

  def destroy

  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:description, :name, :price, :status)
  end
end

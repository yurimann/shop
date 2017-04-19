class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order = current_order
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new(product_params)
  end

  def create
    @product = Product.new(product_params)
    @product.save
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
    def order_item_params
      params.require(:order_item).permit(:quantity, :product_id)
    end
end

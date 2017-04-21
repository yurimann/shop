class CartsController < ApplicationController
  def show
    @order = current_order
    @order_items = @order.order_items
    @order.subtotal
    @order.summarize
    @order.save
  end
end

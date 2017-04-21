class OrderItemsController < ApplicationController
  def create
    @order = current_order
    item = @order.order_items.where(product_id: order_item_params[:product_id]).first
    if item
      quantity = item.quantity
      item.quantity = quantity + order_item_params[:quantity].to_i
      item.save
    else
      @order_item = @order.order_items.new(order_item_params)
      @order_item.get_unit_price
    end
    @order.set_order_status
    @order.subtotal
    @order.summarize
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    @order.subtotal
    @order.summarize
    @order.save
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    @order.subtotal
    @order.summarize
    @order.save
  end

  private
    def order_item_params
      params.require(:order_item).permit(:quantity, :product_id, :unit_price, :total_price)
    end
end

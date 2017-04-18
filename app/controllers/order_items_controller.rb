class OrderItemsController < ApplicationController
  def create
    @order = current_order
    item = OrderItem.where(product_id: order_item_params[:product_id]).first
    if item
      quantity = item.quantity
      x =  order_item_params[:quantity].to_i
      puts x
      item.quantity = quantity + x
      item.save
    else
      @order_item = @order.order_items.new(order_item_params)
      @order_item.get_unit_price
      @order.set_order_status
      @order.save
    end
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private
    def order_item_params
      params.require(:order_item).permit(:quantity, :product_id, :unit_price, :total_price)
    end
end

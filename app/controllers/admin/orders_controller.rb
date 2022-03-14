class Admin::OrdersController < ApplicationController
  def index 
    # @orders = Order.page(params[:page])
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    order = Order.find(params[:id])
    order_details = order.order_details
    order.update(order_params)
    if order.order_status == "payment_confirmation"
      order_details.each do |order_detail|
        order_detail.update(production_status:1)
      end
    end
    redirect_to admin_order_path(order)
  end
  
  private
  def  order_params
    params.require(:order).permit(:customer_id, :shopping_postal_code, :shopping_address,:shopping_name, :shopping_cost, :total_payment, :payment_method, :order_status)
  end
end

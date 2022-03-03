class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    
  end

  def create
  end
  
  def thanks
  end


  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:shipping_postal_code, :shipping_address, :shipping_name, :shipping_cost, :total_payment, :payment_method, :order_status)
  end

end

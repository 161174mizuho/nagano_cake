class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
      @cart_items = current_customer.cart_items.all
      @sum = 0
      @shopping_cost = 800
      @address_ladio = params[:order][:address_ladio]
      @order = Order.new(order_params)
    if @address_ladio == "0"
      @order.shopping_postal_code = current_customer.postal_code
      @order.shopping_address = current_customer.address
      @order.shopping_name = current_customer.first_name + current_customer.last_name
    elsif @address_ladio == "1"
      @address = Address.find(params[:order][:address_id])
      @order.shopping_postal_code = @address.postal_code
      @order.shopping_address = @address.address
      @order.shopping_name = @address.name
    elsif @address_ladio == "2"
    end
  end

  def create
    @address_ladio = params[:order][:address_ladio]
    @order = Order.new(order_params)
    @order.save
    if @address_ladio == "2"
      @address = Address.new
      @address.name = @order.shopping_name
      @address.postal_code = @order.shopping_postal_code
      @address.address = @order.shopping_address
      @address.customer_id = current_customer.id
      @address.save
    end
    @order_detail = OrderDetail.new
    @order_detail.item_id = current_customer.cart_items.item.id
    @order_detail.save
    current_customer.cart_items.clear
    redirect_to orders_thanks_path
  end
  
  def thanks
  end


  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:shopping_cost, :shopping_postal_code, :shopping_address, :shopping_name, :shopping_cost, :payment_method, :total_payment, :order_statusder_statas, :customer_id )
  end
  
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end

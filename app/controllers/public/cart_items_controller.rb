class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @sum = 0
  end
  
  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      # パラムスでID〇のカート内から、ID〇のアイテムを見つける
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      # カートアイテムに見つけたカートIDと、アイテムのIDをおくる
      cart_item.amount += params[:cart_item][:amount].to_i
      # カートアイテムに追加された個数を足す
      cart_item.save
      redirect_to cart_items_path
    else
     cart_item.save
    redirect_to cart_items_path
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end

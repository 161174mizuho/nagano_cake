class Public::AddressesController < ApplicationController
  
  def new
    @address = Address.new
  end
  
  def create
    @address = Address.new
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to address_path
  end
  
  def index
    @addresses = current_customer.addresses
    @address = Address.find(params[:id])
  end

  def edit
  end


  def update
  end
  
  def destroy
  end
  
  private 
  
  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end
end

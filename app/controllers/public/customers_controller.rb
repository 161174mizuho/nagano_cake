class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customer_path(customer)
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    # flash[:notice] = "退会処理を実行いたしました。"
    redirect_to root_path  
  end
  
  private
    def customer_params
      params.require(:customer).permit(:first_name, :first_name_kana, :last_name, :last_name_kana, :address, :postal_code, :telephone_number, :email, :name)
    end
end

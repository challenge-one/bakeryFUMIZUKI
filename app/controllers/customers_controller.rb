class CustomersController < ApplicationController

  before_action :authenticate_customer!
  before_action :set_customer
  before_action :baria_customer

  def edit
  end

  def show
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), success: 'お客様情報が更新されました！'
    else
      flash[:danger] = 'お客様の情報を更新出来ませんでした。空欄の箇所はありませんか？'
      render :edit
    end
  end

  def withdraw
  end

  def withdraw_done
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to customer_top_path, info: 'ありがとうございました。またのご利用を心よりお待ちしております。'
  end

  private

  def customer_params
    params.require(:customer).permit(:is_active, :first_name, :first_name_kana, :family_name, :family_name_kana, :post_code, :address, :email, :tel, cart_items_attributes: [:_destroy])
  end

  def set_customer
    @customer = current_customer
  end

  # 他者のページにアクセスしようとすると直前のページに戻る
  def baria_customer
    if params[:id].to_i != current_customer.id
      redirect_back(fallback_location: root_path)
    end
  end
end

class AddressesController < ApplicationController

  before_action :authenticate_customer!
  before_action :set_customer

  def edit
    @address = Address.find(params[:id])
    if @address.customer_id != current_customer.id
      redirect_back(fallback_location: root_path)
      flash[:danger] = 'お探しのページにアクセスできません。'
    end
  end

  def index
    @address = Address.new
    @addresses = @customer.addresses
  end

  def create
    @address = @customer.addresses.build(address_params)
    if @address.save
      flash[:success] = '新しい住所を登録しました！'
      redirect_to addresses_path
    else
      @addresses = @customer.addresses
      flash[:danger] = '入力内容をご確認ください。各入力欄は2文字以上で記入されていますか？'
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:success] = '住所情報を更新しました！'
      redirect_to addresses_path
    else
      flash[:danger] = '入力内容をご確認ください。各入力欄は2文字以上で記入されていますか？'
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:info] = '登録した住所を削除しました。'
    redirect_to addresses_path
  end

  private

  def set_customer
    @customer = current_customer
  end

  def address_params
    params.require(:address).permit(:post_code, :address, :addressee)
  end
end

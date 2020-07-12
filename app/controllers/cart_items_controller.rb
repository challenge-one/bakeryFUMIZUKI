class CartItemsController < ApplicationController
before_action :set_cart_item, only: [:show, :update, :destroy, :edit]
before_action :set_customer
  def create
    @cart_item = CartItem.new(cart_item_params)
        @cart_item.customer_id = current_customer.id
        @current_item = CartItem.find_by(product_id: @cart_item.product_id,customer_id: @cart_item.customer_id)
        if @current_item.nil?
            if @cart_item.save
                redirect_to cart_items_path, notice: "カートに商品が追加されました。"
            else
                @carts_item = CartItem.all
                render 'index'
            end
        else
          @current_item.quantity += params[:quantity].to_i
            @current_item.update(cart_item_params)
            redirect_to cart_items_path
        end
    end

  def destroy
      @cart_item.destroy
      redirect_to cart_items_path, success: "アイテムを削除しました。"
  end

  def index
    @cart_items = @customer.cart_items.all
  end

  def update
    if @cart_item.update(cart_item_params)
    redirect_to cart_items_path
   end
  end

  def destroy_all #カート内アイテム全部消去
    @customer.cart_items.destroy_all
    redirect_to cart_items_path, success: "カート空にしました"
  end

    private

      def set_customer
        @customer = current_customer
      end

      def set_cart_item
        @cart_item = CartItem.find(params[:id])
      end

    def cart_item_params
          params.require(:cart_item).permit(:product_id, :customer_id, :quantity)
      end

      def product_params
        params.require(:product).permit(:name,:price,:id,)
      end
end

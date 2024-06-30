class PurchasesController < ApplicationController

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new(order_purchase_params)
    if @order_purchase.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] #秘密鍵
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: @order_purchase.token,    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order_purchase.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_purchase_params
    params.require(:order_purchase).permit(:post_code, :municipality, :prefecture_id, :street_addres, :building_name, :photo_num).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

end

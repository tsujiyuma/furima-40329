class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new(order_purchase_params)
    if @order_purchase.valid?
      @order_purchase.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_purchase_params
    params.require(:order_purchase).permit(:post_code, :municipality, :prefecture_id, :street_addres, :building_name, :photo_num).merge(item_id: @item.id, user_id: current_user.id)
  end

end

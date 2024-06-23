class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:id])
    @order_purchase = Orderpurchase.new(order_purchase_params)
    if @order_purchase.valid?
      @order_purchase.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
  end

  private

    def order_purchase_params
      params.require(:order_purchase).permit(:post_code, :municipality, :prefecture, :street_name, :building_name, :photo_num).merge(item_id: @item.id, user_id: @item.user_id)
    end
  end

end

class OrderPurchase
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :street_addres, :building_name, :photo_num, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを含む7桁の数字で入力してください' }
    validates :municipality
    validates :street_addres
    validates :photo_num, length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true },
                          format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id:, item_id:)
    Purchase.create(post_code:, municipality:, prefecture_id:, street_addres:,
                    building_name:, photo_num:, order_id: order.id)
  end
end

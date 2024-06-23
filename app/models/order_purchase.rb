class Orderpurchase
  include AcitveModel::Model
  attr_accessor :post_code, :prefecture, :municipality, :street_name, :building_name, :photo_num

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "はハイフンを含む7桁の数字で入力してください" }
    validates :municipality
    validates :street_name
    validates :photo_num,length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true }, format: { with: /\A[0-9]+\z/, message:"は半角数字で入力してください" }
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Purchase.create(post_code: post_code, municipality: municipality, prefecture: prefecture, street_name: street_name, building_name: building_name,photo_num: photo_num, order_id: order.id ) 
  end
end
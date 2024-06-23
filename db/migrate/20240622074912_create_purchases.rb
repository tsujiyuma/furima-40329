class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.references :order, oreign_key: true, null:false
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :municipality, null: false
      t.string :street_addres, null:false
      t.string :building_name
      t.string :photo_num, null: false
      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :name,                       null: false
      t.text    :explanation,                null: false
      t.integer :user_id,                    foreign_key: true
      t.integer :category_id,                null: false
      t.integer :product_status_id,          null: false
      t.integer :shipping_charge_id,         null: false
      t.integer :prefecture_id,              null: false
      t.integer :estimated_shipping_date_id, null: false
      t.integer :price,                      null: false
      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.references :user,       null: false, foreign_key: true
      t.string :title,          null: false
      t.text :detail,           null: false 
      t.integer :category_id,   null: false
      t.integer :situation_id,  null: false 
      t.integer :shipping_charge_id,   null: false
      t.integer :prefecture_id,  null: false
      t.integer :shipping_day_id, null: false 
      t.integer :price,        null: false
    end
  end
end

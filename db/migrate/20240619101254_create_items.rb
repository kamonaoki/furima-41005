class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :item_name,              null: false
      t.integer    :category_id,            null: false
      t.integer    :price,                  null: false
      t.text       :detail,                 null: false
      t.integer    :condition_id,           null: false
      t.integer    :burden_id,              null: false
      t.integer    :prefecture_id,          null: false
      t.integer    :delivery_date_id,       null: false
      t.references :user,                   null: false, foreign_key: true
      t.timestamps

      
    end
  end
end

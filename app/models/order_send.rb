class OrderSend
  include ActiveModel::Model
  attr_accessor  :post_code, :prefecture_id, :city, :street_address, :building_name, :telephone, :order_id, :item_id, :user_id     
        
end
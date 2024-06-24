class OrderAddress
  include ActiveModel::Model
  attr_accessor  :post_code, :prefecture_id, :city, :street_address, :building_name, :telephone,:order_id, :item_id, :user_id
  
  
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city, :street_address, :item_id, :user_id, presence: true
  with_options presence: true do
    validates :post_code,format: { with:  /\A\d{3}-\d{4}\z/, message: 'エラー' }
    validates :telephone,format: { with:/\A\d{10,11}+\z/, message: 'エラー' }
  end

  def save
    puts "item_id: #{item_id}, user_id: #{user_id}"  # デバッグ用の出力
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      city: city,
      street_address: street_address,
      building_name: building_name,
      telephone: telephone,
      order_id: order.id
    )
  end

end
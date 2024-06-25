class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street_address, :building_name, :telephone, :order_id, :item_id, :user_id,
                :token

  validates :prefecture_id, numericality: { other_than: 1, message: 'must be other than 1' }
  with_options presence: true do
    validates :city, :street_address, :item_id, :user_id, :token
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid' }
    validates :telephone, format: { with: /\A\d{10,11}+\z/, message: 'is invalid' }
  end

  def save
    order = Order.create(item_id:, user_id:)
    Address.create(
      post_code:,
      prefecture_id:,
      city:,
      street_address:,
      building_name:,
      telephone:,
      order_id: order.id
    )
  end
end

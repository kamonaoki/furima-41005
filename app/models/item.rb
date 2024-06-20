class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :delivery_date

  validates :item_name, :price, :detail, presence: true
  validates :category_id, :condition_id, :burden_id, :prefecture_id, :delivery_date_id, numericality: { other_than: 1 } 
end

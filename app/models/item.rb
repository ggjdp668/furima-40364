class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_bearer
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :image,                  presence: true
  validates :item_name,              presence: true
  validates :description,            presence: true
  validates :category_id,            numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,           numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_bearer_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,          numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
end

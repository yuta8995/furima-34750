class Item < ApplicationRecord
  belongs_to :user
  # has_one    :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_paid_by
  belongs_to :item_location
  belongs_to :shipping_date

  with_options presence: true do
    validates :image, :item_name, :item_description, :price
  end

  validates :category_id, :item_condition_id, :shipping_paid_by_id, :item_location_id, 
  :shipping_date_id, numericality: {other_than: 0, message: "can't be blank"}

end

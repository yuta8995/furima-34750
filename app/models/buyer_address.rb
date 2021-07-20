class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :item_location_id, :municipality, :house_number, :building_name, :tel

  with_options presence: true do
    validates :user_id, :item_id, :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  end

  validates :item_location_id, numericality: {other_than: 0, message: "can't be blank"}

  with_options presence: true do
    validates :municipality, :house_number
    validates :tel, format: {with: /\A\d{10,11}\z/, message: "is invalid. Input only number"}
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, item_location_id: item_location_id, municipality: municipality, house_number: house_number, building_name: building_name, tel: tel, buyer_id: buyer.id)
  end

end
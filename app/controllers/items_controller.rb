class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new


  def index
  end

  def new
  end

  # private

  # def message_params
    # params.require(:item).permit(:item_name, :item_description, :category_id, :item_condition_id, :shipping_paid_by_id, :item_location_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  # end

end

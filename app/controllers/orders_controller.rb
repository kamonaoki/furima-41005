class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only:[:index, :create]
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :street_address, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path
    end
  end 
end
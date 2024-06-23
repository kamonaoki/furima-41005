class OrdersController < ApplicationController

def index
  @order_send = OrderSend.new
end

def create
  @order_send = DonationAddress.new(order_params)
  if  @order_send.valid?
    @order_send.save
    redirect_to root_path
  else
    render :index, status: :unprocessable_entity
  end
end


def order_params
  params.require(:order_send).permit(:post_code, :prefecture_id, :city, :street_address, :building_name, :telephone, :order_id, :item_id ).merge(user_id: current_user.id, item_id: params[:item_id], order_id: params[:order_id])
end

end

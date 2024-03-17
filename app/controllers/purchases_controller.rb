class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create, :check_redirect]
  before_action :check_redirect, only: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_address = PurchaseAddress.new
  end
  
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def check_redirect
    if user_signed_in?
      if @item.purchase.present? && @item.user_id != current_user.id
        redirect_to root_path
      elsif @item.user_id == current_user.id
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

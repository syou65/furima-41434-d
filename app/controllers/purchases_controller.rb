class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :check_order_conditions
  def index
    @purchase_form = PurchaseForm.new
  end
  def create
    @purchase_form = PurchaseForm.new(purchase_form_params)
    if @purchase_form.valid? # バリデーションが成功した場合
      @purchase_form.save
      redirect_to root_path, notice: '購入が完了しました'
    else # バリデーションエラーの場合
      flash.now[:alert] = '入力に問題があります'
      render :index
    end
  end
  private
  def purchase_form_params
    params.require(:purchase_form).permit(
      :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :token
    ).merge(user_id: current_user.id, item_id: @item.id)
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
  def check_order_conditions
    redirect_to root_path if @item.purchase.present? || current_user == @item.user
  end
  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_form_params[:token],
      currency: 'jpy'
    )
  end
end

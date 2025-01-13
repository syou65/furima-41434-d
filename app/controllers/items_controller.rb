class ItemsController < ApplicationController
 before_action :authenticate_user!, only: [:new, :create,:edit, :destroy]
 before_action :set_item, only: [:edit, :show, :update, :destroy]
  def index
    @items = Item.order(created_at: :desc)
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
  end
  def edit
    redirect_to root_path unless current_user == @item.user 
  end
  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: 
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    if @item.destroy
      redirect_to root_path, notice: 
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:title, :detail, :category_id, :situation_id, :shipping_charge_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def check_owner
    unless @item.user == current_user
      redirect_to root_path, alert: 
    end
  end
end

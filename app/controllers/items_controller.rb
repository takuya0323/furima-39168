class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new,:create,:edit,:update]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    if @item.user_id == current_user.id
    @item = Item.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(item_params)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:information,:item_category_id,:shipping_cost_id,:shipping_date_id,:prefecture_id,:image,:price,:item_status_id).merge(user_id: current_user.id)
  end

end
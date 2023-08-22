class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
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
      render :new, status: :unprocessable_entity
    end
  end

private

  def item_params
    params.require(:item).permit(:image,:title,:explanation,:price,:category_id,:condition_id,:charge_id,:prefecture_id,:leadtime_id).merge(user_id: current_user.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end
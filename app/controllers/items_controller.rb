class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [ :show, :edit, :update]
  before_action :require_permission, only: [:update, :edit]
  
  def index
    @items = Item.all.order("id DESC")
  end

  def show
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

  def edit
  end

  def update
    @item.update(item_params)
      redirect_to item_path(@item)
  end
  


  private
  def item_params
    params.require(:item).permit(:product,:explanation,:category_id,:state_id,:burden_id,:prefecture_id,:day_id,:price,:image).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end 
  def require_permission
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end

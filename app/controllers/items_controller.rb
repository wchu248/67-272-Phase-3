class ItemsController < ApplicationController
  # A callback to set up an @owner object to work with 
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :color, :category, :weight, :inventory_level, :reorder_level, :active)
    end

end

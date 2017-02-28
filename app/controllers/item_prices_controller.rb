class ItemPricesController < ApplicationController
  # A callback to set up an @owner object to work with 
  before_action :set_item_price, only: [:show, :edit, :update, :destroy]

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
    def set_item_price
      @item_price = ItemPrice.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def item_price_params
      params.require(:item_price).permit(:item, :price, :start_date, :end_date)
    end
    
end

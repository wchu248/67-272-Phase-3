class ItemPricesController < ApplicationController
  # A callback to set up an @owner object to work with 
  before_action :set_item_price, only: [:show, :edit, :update, :destroy]

  def index
    #@active_items
  end

  def new
    @item_price = ItemPrice.new
  end

  def edit
  end

  def show
  end

  def create
    @item_price = ItemPrice.new(item_price_params)
    if @item_price.save
        # if saved to database
        flash[:notice] = "Changed the price of #{@item_price.item.name}."
        redirect_to item_path(@item_price.item) # go to show item page
    else
        # return to the 'new' form
        render action: 'new'
    end
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
      params.require(:item_price).permit(:item_id, :price, :start_date, :end_date)
    end

end

class ItemPricesController < ApplicationController

  def index
    @active_items = Item.active.paginate(page: params[:page]).per_page(10)
  end

  def new
    @item_price = ItemPrice.new
  end

  def create
    @item_price = ItemPrice.new(item_price_params)
    @item_price.start_date = Date.current
    if @item_price.save
        # if saved to database
        @item = @item_price.item
        flash[:notice] = "Changed the price of #{@item.name}."
        redirect_to item_path(@item) # go to show item page
    else
        # return to the 'new' form
        render action: 'new'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def item_price_params
      params.require(:item_price).permit(:item_id, :price, :start_date, :end_date)
    end

end

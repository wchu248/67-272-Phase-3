class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    # Use this to show all the items broken down by category and ordered alphabetically
    @boards = Item.active.for_category('boards').alphabetical
    @pieces = Item.active.for_category('pieces').alphabetical
    @clocks = Item.active.for_category('clocks').alphabetical
    @supplies = Item.active.for_category('supplies').alphabetical
    @inactive_items = Item.inactive.alphabetical
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def show
    # need to show price history, similar items, and other details in the item show page
    @price_history = @item.item_prices.chronological.to_a
    @similar_items = Item.active.for_category(@item.category).alphabetical.select{ |i| i != @item }
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        # if saved to database
        flash[:notice] = "Successfully created #{@item.name}."
        redirect_to item_path(@item) # go to show item page
    else
        # return to the 'new' form
        render action: 'new'
    end
  end

  def update
    if @item.update_attributes(item_params)
        flash[:notice] = "Successfully updated #{@item.name}."
        redirect_to @item
    else
        render action: 'edit'
    end
  end

  def destroy
    @item.destroy
    flash[:notice] = "Successfully removed #{@item.name} from the system."
    redirect_to items_url
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

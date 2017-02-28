class ItemsController < ApplicationController
  # A callback to set up an @owner object to work with 
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Item.active.for_category('boards').alphabetical.paginate(page: params[:page]).per_page(10)
    @pieces = Item.active.for_category('pieces').alphabetical.paginate(page: params[:page]).per_page(10)
    @clocks = Item.active.for_category('clocks').alphabetical.paginate(page: params[:page]).per_page(10)
    @supplies = Item.active.for_category('supplies').alphabetical.paginate(page: params[:page]).per_page(10)
    @inactive_items = Item.inactive.alphabetical.paginate(page: params[:page]).per_page(10)
  end #done

  def new
    @item = Item.new
  end #done

  def edit
  end #done

  def show
  end

  def create
  end

  def update
  end

  def destroy
    @item.destroy
    flash[:notice] = "Successfully removed #{@item.name} from the system."
    redirect_to items_url
  end #done

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

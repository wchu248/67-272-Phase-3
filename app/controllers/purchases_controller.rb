class PurchasesController < ApplicationController
  # A callback to set up an @owner object to work with 
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def index
    @purchases = Purchase.all.paginate(page: params[:page]).per_page(10)
  end

  def new
    @purchase = Purchase.new
  end

  def edit
  end

  def show
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.date = Date.today
    if @purchase.save
        # if saved to database
        flash[:notice] = "Successfully added a purchase for #{@purchase.quantity} #{@purchase.item.name}."
        redirect_to purchases_path # go to show purchase page
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
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:item_id, :quantity, :date)
    end

end

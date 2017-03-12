class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.all.chronological.paginate(page: params[:page]).per_page(10)
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.date = Date.current
    if @purchase.save
        # if saved to database
        flash[:notice] = "Successfully added a purchase for #{@purchase.quantity} #{@purchase.item.name}."
        redirect_to purchases_path # go to show purchase page
    else
        # return to the 'new' form
        render action: 'new'
    end
  end

    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:item_id, :quantity, :date)
    end

end

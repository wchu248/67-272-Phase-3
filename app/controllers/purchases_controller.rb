class PurchasesController < ApplicationController
  # A callback to set up an @owner object to work with 
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

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
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:item, :quantity, :date)
    end

end

class HomeController < ApplicationController
  def home
    @items_to_reorder = Item.need_reorder.all.paginate(page: params[:page]).per_page(10)
  end

  def about
  end

  def contact
  end

  def privacy
  end
end

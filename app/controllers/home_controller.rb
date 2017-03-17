class HomeController < ApplicationController
  def home
    # Use this to show the items that need to be reordered
    @items_to_reorder = Item.need_reorder.all.paginate(page: params[:page]).per_page(10)
  end

  def about
  end

  def contact
  end

  def privacy
  end
end

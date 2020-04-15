class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    @items = Item.all
    
    @new_arrival = Item.order(created_at: :asc).last(5)
  end
  
  def category
    catName = params[:title]
    @items = Item.where("category like ? ", catName)
  end
  
  def about
  end
  
  def contact
  end
  
end


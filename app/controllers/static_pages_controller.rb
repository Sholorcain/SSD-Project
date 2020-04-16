class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    @items = Item.all
    @itemfeatured1 = Item.find_by_id(20)
    @itemfeatured2 = Item.find_by_id(2)
    @itemfeatured3 = Item.find_by_id(19)
    
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


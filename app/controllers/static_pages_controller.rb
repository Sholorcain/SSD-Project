class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    @items = Item.all
    
    @new_arrival = Item.order(created_at: :asc).last(10)
    #@business_partner.received_documents.order(:created_at).limit(5)
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


class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    @items = Item.all
  end
  
  def category
    catName = params[:title]
    @items = Item.where("category like ? ", catName)
  end
  
  def about
  end
  
  def contact
  end
  
  def paypalSendBox
    @order = Order.find(params[:id])
    @order.update_attribute(:status, "Paid by Paypal")
  end
  
end


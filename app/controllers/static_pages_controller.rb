<<<<<<< HEAD
class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    @items = Item.all
  end
  
  def category
    catName = params[:title]
    @items = Item.where("category like ? ", catName)
  end
  
  def help
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
=======
class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    @items = Item.all
  end
  
  def category
    catName = params[:title]
    @items = Item.where("category like ? ", catName)
  end
  
  def help
  end
  
  def about
  end
  
  def contact
  end
  
  
end
>>>>>>> 0c8461e2b0e19bdd2dfc6a2b4724003fe1102c5a

class ReviewsController < ApplicationController

def create
  if logged_in?
    @review = Review.new(review_params)
    @review.item_id = params[:item_id]
    #I guess user_id already gets set.
    #@review.user_id = params[:user_id]
    if @review.save
      flash[:info] = "Thanks for leaving a review"
    end
    redirect_to item_path(@review.item)
  else
    redirect_to item_path(params[:item_id])
  end
    
end

def destroy
    @item = Item.find(params[:item_id])
    @review = @item.reviews.find(params[:id])
    @review.destroy
    redirect_to item_path(@item)
end

def review_params
  params.require(:review).permit(:author_name, :body,:user_id,:rating)
end
    
end

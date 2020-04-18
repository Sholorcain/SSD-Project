class Item < ApplicationRecord
    has_many :reviews, dependent: :destroy
    
    validates :category, presence: true
    validates :title, presence:true
    validates :author, presence:true
    validates :description, presence:true
    validates :price, presence:true,numericality: true
    validates :image_url, presence:true
    
    def score
    self.reviews.average('rating')
    end
    
    def blank_stars
        5 - score.to_i
    end
    
    def stock_limit
    #    stock <= 0
    end
    
    #Following scopes are used to sort the products
    scope :expensive, -> { order(price: :desc) }
    scope :cheapest, -> { order(price: :asc) }
    #Groups review average rating and items tables so that we can sort by rating
    scope :bestrated, -> { (where("items.id in (select item_id from reviews)").group('items.id, items.title, items.author,items.description,items.price,items.image_url,items.category,items.stock').joins(:reviews).order('AVG(reviews.rating) DESC'))}
    scope :lowestrated, -> { (where("items.id in (select item_id from reviews)").group('items.id, items.title, items.author,items.description,items.price,items.image_url,items.category,items.stock').joins(:reviews).order('AVG(reviews.rating) ASC'))}
    
end

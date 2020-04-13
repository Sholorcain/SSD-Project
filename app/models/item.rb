class Item < ApplicationRecord
    has_many :reviews, dependent: :destroy
    
    def score
    self.reviews.average('rating')
    end
    
    def blank_stars
        5 - score.to_i
    end
    
    def stock_limit
        stock <= 0
    end
    
    scope :expensive, -> { order(price: :desc) }
    scope :cheapest, -> { order(price: :asc) }
    scope :bestrated, -> { (where("items.id in (select item_id from reviews)").group('items.id, items.title, items.author,items.description,items.price,items.image_url,items.category,items.stock').joins(:reviews).order('AVG(reviews.rating) DESC'))}
    #scope :bestrated, -> { includes(:reviews).group('item_id').order('AVG(review.rating) desc')}
    scope :lowestrated, -> { (where("items.id in (select item_id from reviews)").group('items.id, items.title, items.author,items.description,items.price,items.image_url,items.category,items.stock').joins(:reviews).order('AVG(reviews.rating) ASC'))}

    #scope :lowestrated, -> { order(title: :asc) }
    
end

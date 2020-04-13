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
    scope :bestrated, -> { order(title: :desc) }
    scope :lowestrated, -> { order(title: :asc) }
    
    
end

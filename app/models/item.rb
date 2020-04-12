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
end

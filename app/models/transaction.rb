class Transaction < ApplicationRecord
    
    scope :fuel, -> { where(category: "fuel")}
    scope :food, -> { where(category: "food")}
    scope :fun, -> { where(category: "fun")}

    validates :t_type, presence: true
    validates :date, presence: true
    
end
class Transaction < ApplicationRecord
    belongs_to :user
    scope :fuel, -> { where(category: "fuel")}
    scope :food, -> { where(category: "food")}
    scope :fun, -> { where(category: "fun")}

    validates :amount, presence: true
    validates :date, presence: true
    
end
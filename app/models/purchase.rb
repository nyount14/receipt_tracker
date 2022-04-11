class Purchase < ApplicationRecord
    belongs_to :user
    has_many :purchase_reasons
    has_many :reasons, through: :purchase_reasons

    scope :fuel, -> { where(category: "fuel")}
    scope :food, -> { where(category: "food")}
    scope :fun, -> { where(category: "fun")}

    validates :amount, presence: true
    validates :date, presence: true
    
end
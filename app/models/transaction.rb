class Transaction < ApplicationRecord
    
    # scope :fun_category, -> { where(category) = "fun" }

    validates :t_type, presence: true
    validates :date, presence: true
    
end
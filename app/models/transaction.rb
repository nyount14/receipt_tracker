class Transaction < ApplicationRecord
    
    validates :t_type, presence: true
    validates :date, presence: true
    
end
class Transaction < ApplicationRecord
    validates :transaction_type, presence: true
    validates :amount, presence: true
    validates :date, presence: true
end
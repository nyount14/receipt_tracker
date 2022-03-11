class Transaction < ApplicationRecord
    validates :amount, presence: true, :transaction_type, presence: true, :date, presence: true
end
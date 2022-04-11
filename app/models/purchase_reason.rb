class PurchaseReason < ApplicationRecord
    # belongs_to :transaction
    belongs_to :purchase
    belongs_to :reason
end
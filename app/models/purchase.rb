class Purchase < ApplicationRecord
    belongs_to :user
    has_many :purchase_reasons
    has_many :reasons, through: :purchase_reasons

    scope :Amazon, -> { where(payment_method: "Amazon CC")}
    scope :Freedom, -> { where(payment_method: "Freedom CC")}

    validates :amount, presence: true
    validates :date, presence: true
    
end
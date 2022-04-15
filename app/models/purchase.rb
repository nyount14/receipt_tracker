class Purchase < ApplicationRecord
    belongs_to :user
    has_many :purchase_reasons
    has_many :reasons, through: :purchase_reasons

    scope :amazon, -> { where(payment_method: "Amazon CC")}
    scope :freedom, -> { where(payment_method: "Freedom CC")}
    scope :cash, -> { where(payment_method: "cash")}

    validates :amount, presence: true
    validates :date, presence: true
    
end
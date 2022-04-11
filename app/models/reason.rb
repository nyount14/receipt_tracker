class Reason < ApplicationRecord
    validates_uniqueness_of :option

    has_many :purchase_reasons
    has_many :purchases, through: :purchase_reasons
end
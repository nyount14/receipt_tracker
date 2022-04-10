class Reason < ApplicationRecord
    validates_uniqueness_of :option
end
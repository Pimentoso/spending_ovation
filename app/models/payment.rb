class Payment < ApplicationRecord
    # validates :amount, uniqueness: { scope: :date }

    has_and_belongs_to_many :tags

    enum direction: [ :inbound, :outbound ]
end

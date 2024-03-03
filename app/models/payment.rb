class Payment < ApplicationRecord

    has_and_belongs_to_many :tags

    enum direction: [ :inbound, :outbound ]

    attr_accessor :ignored

    before_save :check_if_ignored
    after_save :remove_duplicate_tags

    private

    def check_if_ignored
        return false if ignored
    end

    def remove_duplicate_tags
        # TODO
    end
end

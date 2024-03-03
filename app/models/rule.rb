class Rule < ApplicationRecord

    enum operator: [ :contains ]
    enum action: [ :ignore, :apply_tag ]

    def applies_to?(payment)
        case operator
        when :contains
            payment.description.downcase.includes?(value.downcase)
        end
    end

    def execute(payment)
        case action
        when :ignore
            payment.ignored = true
        when :apply_tag
            tag = Tags.find_by_id(action_target)
            payment.tags << tag if tag
        end
    end

    def execute!(payment)
        execute(payment)
        payment.save!
    end

end

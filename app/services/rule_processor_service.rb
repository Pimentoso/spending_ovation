class RuleProcessorService

    attr_reader :payments

    def initialize(payments:)
        @payments = payments
    end

    def call
        payments.each do |payment|
            rules.each do |rule|
                if rule.applies_to?(payment)
                    rule.execute!(payment)
                end
            end
        end
    end

    private

    def rules
        @rules = Rule.all
    end
end
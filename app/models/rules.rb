class Rule < ApplicationRecord

    enum operator: [:contains, :starts_with]
    enum action: [:ignore, :apply_tag]

end
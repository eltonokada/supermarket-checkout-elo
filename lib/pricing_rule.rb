# frozen_string_literal: true

# PricingRule class is the parent class for all pricing rules.
# It has an abstract method apply_rule that should be implemented in the subclass.
class PricingRule
  attr_accessor :item_title

  def apply_rule
    raise 'This method should be implemented in the subclass'
  end
end

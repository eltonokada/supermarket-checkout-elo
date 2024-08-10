# frozen_string_literal: true

require './lib/pricing_rule'

# TotalDiscount class inherits from PricingRule.
# It applies a discount to the total if the total is greater than a minimum amount.
class TotalDiscount < PricingRule
  attr_accessor :discount_percentage, :minimum_total

  def initialize(discount_percentage, minimum_total)
    @discount_percentage = discount_percentage
    @minimum_total = minimum_total
  end

  def apply_rule(total)
    return total - (total * @discount_percentage / 100) if total > @minimum_total

    total
  end
end

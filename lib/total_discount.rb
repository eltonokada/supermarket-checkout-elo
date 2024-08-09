require './lib/pricing_rule'

class TotalDiscount < PricingRule
  attr_accessor :discount_percentage
  
  def initialize(discount_percentage)
    @discount_percentage = discount_percentage
  end

  def apply_rule(total)
    total - (total * @discount_percentage / 100)
  end
end
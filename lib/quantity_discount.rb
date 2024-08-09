require './lib/pricing_rule'

class QuantityDiscount < PricingRule
  attr_accessor :num_items, :discount_price
  
  def initialize(item_title, num_items, discount_price)
    super(item_title)
    @num_items = num_items
    @discount_price = discount_price
  end

  def apply_rule(items)
    items.sum - ((items.size / @num_items) * @discount_price)
  end
end
# frozen_string_literal: true

require './lib/pricing_rule'

# QuantityDiscount class inherits from PricingRule.
# It applies a discount to the total based on the quantity of items purchased.
class QuantityDiscount < PricingRule
  attr_accessor :item_title, :num_items, :discount

  def initialize(item_title, num_items, discount)
    @item_title = item_title
    @num_items = num_items
    @discount = discount
  end

  def apply_rule(items)
    items.sum - ((items.size / @num_items) * @discount)
  end
end

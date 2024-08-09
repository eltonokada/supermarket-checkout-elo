require './lib/pricing_rule'

class QuantityDiscount < PricingRule
  attr_accessor :item_title, :num_items, :discount_price
  
  def initialize(item_title, num_items, discount_price)
    @item_title = item_title
    @num_items = num_items
    @discount_price = discount_price
  end

  def apply_rule(items)
    items.sum - ((items.size / @num_items) * @discount_price)
  end
end
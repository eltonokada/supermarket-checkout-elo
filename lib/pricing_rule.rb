class PricingRule
  attr_accessor :item_title

  def initialize(item_title)
    @item_title = item_title
  end

  def apply_rule(items)
    raise "This method should be implemented in the subclass"
  end
end
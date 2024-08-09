class PricingRule
  attr_accessor :item_title

  def apply_rule(items)
    raise "This method should be implemented in the subclass"
  end
end
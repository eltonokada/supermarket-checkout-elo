class Checkout
  attr_accessor :items

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
  end

  def scan(item)
    # This is the method that should add items to the checkout
    # It should store the items in an array
    @items << item
  end

  def total
    # This is the method that should return the total price of the items in the checkout
    # It should apply the pricing rules to the items and return a total value
  end

end
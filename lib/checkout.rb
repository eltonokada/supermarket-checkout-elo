class Checkout
  attr_accessor :items, :pricing_rules

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @items = []
  end

  def scan(item)
    @items << item
  end

  def total
    total = 0
    @items.group_by(&:title).each do |title, items|
      @pricing_rules.each do |rule|
        total += rule.apply_rule(items.map(&:price)) if rule.item_title == title
      end
    end
    total
  end

end
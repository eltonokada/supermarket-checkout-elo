class TotalCalculator
  attr_accessor :items, :pricing_rules
  
  def initialize(items, pricing_rules)
    @items = items
    @pricing_rules = pricing_rules
  end

  def calculate_total
    total = 0
    @items.group_by(&:title).each do |title, items|
      total += calculate_with_rules(title, items)
    end
    apply_total_discount(total)
  end

  private

  def applicable_rules(title)
    @pricing_rules.select { |rule| rule.item_title == title }
  end

  def calculate_with_rules(title, items)
    return applicable_rules(title).sum { |rule| rule.apply_rule(items.map(&:price)) } if applicable_rules(title).any?
    items.map(&:price).sum
  end

  def apply_total_discount(total)
    total_rule = @pricing_rules.select { |rule| rule.is_a?(TotalDiscount) }.first
    total_rule.nil? ? total : total_rule.apply_rule(total)
  end
end

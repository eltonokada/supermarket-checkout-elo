class TotalCalculator

  class TotalCalculatorError < StandardError; end

  attr_accessor :items, :pricing_rules
  
  def initialize(items, pricing_rules)
    @items = items
    @pricing_rules = pricing_rules
  end

  def calculate_total
    total = 0

    begin
      @items.group_by(&:title).each do |title, items|
        total += calculate_item_total(title, items)
      end
      apply_total_discount(total)
    rescue => e
      raise TotalCalculatorError.new("An error occurred while calculating the total: #{e.message}")
    end
  end

  private

  def applicable_rules(title)
    @pricing_rules.select { |rule| rule.item_title == title }
  end

  def calculate_item_total(title, items)
    rules = applicable_rules(title)
    if rules.any?
      rules.sum { |rule| rule.apply_rule(items.map(&:price)) }
    else
      items.sum(&:price)
    end
  end

  def apply_total_discount(total)
    total_rule = @pricing_rules.select { |rule| rule.is_a?(TotalDiscount) }.first
    total_rule.nil? ? total : total_rule.apply_rule(total)
  end
end

# frozen_string_literal: true

require './lib/total_calculator'

# Checkout class is responsible for scanning items and calculating the total.
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
    TotalCalculator.new(@items, @pricing_rules).calculate_total
  end

  def clear
    @items = []
  end
end

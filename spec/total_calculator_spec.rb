# frozen_string_literal: true

require './lib/total_calculator'

describe TotalCalculator do
  describe '#initialize' do
    it 'should have an items attribute that is an array' do
      items = []
      pricing_rules = []
      total_calculator = TotalCalculator.new(items, pricing_rules)
      expect(total_calculator.items).to eq([])
    end
    it 'should have a pricing_rules attribute that is an array' do
      items = []
      pricing_rules = []
      total_calculator = TotalCalculator.new(items, pricing_rules)
      expect(total_calculator.pricing_rules).to eq([])
    end
  end

  describe '#calculate_total' do
    it 'should return the total price of the items' do
      pricing_rules = []
      checkout = Checkout.new(pricing_rules)
      item = double('item', title: 'A', price: 50.10)
      checkout.scan(item)
      checkout.scan(item)
      expect(checkout.total).to eq(100.20)
    end
    it 'should return the total price of the items after applying the rules' do
      pricing_rules = [double('rule', item_title: 'A', apply_rule: 90)]
      checkout = Checkout.new(pricing_rules)
      item = double('item', title: 'A', price: 50)
      checkout.scan(item)
      checkout.scan(item)
      expect(checkout.total).to eq(90)
    end
  end
end

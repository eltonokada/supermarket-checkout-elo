# frozen_string_literal: true

require './lib/checkout'

describe Checkout do
  describe '#initialize' do
    it 'should have an items attribute that is an array' do
      pricing_rules = []
      checkout = Checkout.new(pricing_rules)
      expect(checkout.items).to eq([])
    end
    it 'should have a pricing_rules attribute that is an array' do
      pricing_rules = []
      checkout = Checkout.new(pricing_rules)
      expect(checkout.pricing_rules).to eq([])
    end
  end

  describe '#scan' do
    it 'should add an item to the items array' do
      pricing_rules = []
      checkout = Checkout.new(pricing_rules)
      item = double('item')
      checkout.scan(item)
      expect(checkout.items).to eq([item])
    end
  end
end

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

  describe '#applicable_rules' do
    it 'should return an array of rules that apply to the item' do
      pricing_rules = [double('rule', item_title: 'A'), double('rule', item_title: 'B')]
      checkout = Checkout.new(pricing_rules)
      expect(checkout.applicable_rules('A').size).to eq(1)
    end
  end

  describe '#total' do
    it 'should return the total price of the items' do
      pricing_rules = []
      checkout = Checkout.new(pricing_rules)
      item = double('item', title: 'A', price: 50)
      checkout.scan(item)
      checkout.scan(item)
      expect(checkout.total).to eq(100)
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

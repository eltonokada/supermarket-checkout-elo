# frozen_string_literal: true

require './lib/quantity_discount'
require './lib/pricing_rule'

describe QuantityDiscount do
  describe '#initialize' do
    it 'should have an item_title attribute' do
      quantity_discount = QuantityDiscount.new('A', 2, 10)
      expect(quantity_discount.item_title).to eq('A')
    end
    it 'should have a num_items attribute' do
      quantity_discount = QuantityDiscount.new('A', 2, 10)
      expect(quantity_discount.num_items).to eq(2)
    end
    it 'should have a discount attribute' do
      quantity_discount = QuantityDiscount.new('A', 2, 10)
      expect(quantity_discount.discount).to eq(10)
    end
  end
  describe '#apply_rule' do
    it 'should return the total price after applying the discount' do
      quantity_discount = QuantityDiscount.new('A', 2, 10)
      items = [50, 50, 50]
      expect(quantity_discount.apply_rule(items)).to eq(140)
    end
  end
end

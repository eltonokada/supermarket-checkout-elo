require './lib/total_discount'

describe TotalDiscount do
  describe '#initialize' do
    it 'should have a discount_percentage attribute' do
      total_discount = TotalDiscount.new(10)
      expect(total_discount.discount_percentage).to eq(10)
    end
  end
  describe '#apply_rule' do
    it 'should return the total price after applying the discount' do
      total_discount = TotalDiscount.new(10)
      items = [50, 50, 50]
      expect(total_discount.apply_rule(items.sum)).to eq(135)
    end
  end
end
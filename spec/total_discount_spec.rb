require './lib/total_discount'

describe TotalDiscount do
  describe '#initialize' do
    it 'should have a discount_percentage attribute' do
      total_discount = TotalDiscount.new(10, 200)
      expect(total_discount.discount_percentage).to eq(10)
    end
  end
  describe '#apply_rule' do
    it 'should return the total price after applying the discount without minimum value' do
      total_discount = TotalDiscount.new(10, 200)
      items = [50, 50, 50]
      expect(total_discount.apply_rule(items.sum)).to eq(150)
    end
    it 'should return the total price after applying the discount with minimum value' do
      total_discount = TotalDiscount.new(10, 200)
      items = [50, 50, 50, 60]
      expect(total_discount.apply_rule(items.sum)).to eq(189)
    end    
  end
end
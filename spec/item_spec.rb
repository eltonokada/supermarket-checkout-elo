# frozen_string_literal: true

require './lib/item'

describe Item do
  describe '#initialize' do
    it 'should have a title attribute' do
      item = Item.new('A', 50)
      expect(item.title).to eq('A')
    end
    it 'should have a price attribute' do
      item = Item.new('A', 50)
      expect(item.price).to eq(50)
    end
  end
end

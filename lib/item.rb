# frozen_string_literal: true

# Item class represents an item with a title and a price.
class Item
  attr_accessor :title, :price

  def initialize(title, price)
    @title = title
    @price = price
  end
end

# frozen_string_literal: true

require './lib/checkout'
require './lib/pricing_rule'
require './lib/quantity_discount'
require './lib/total_discount'
require './lib/item'

# This is just a sample code to test the checkout system

pricing_rule1 = QuantityDiscount.new('A', 2, 10)
pricing_rule2 = QuantityDiscount.new('B', 3, 15)
pricing_rule3 = TotalDiscount.new(10, 200)

pricing_rules = [pricing_rule1, pricing_rule2, pricing_rule3]

checkout = Checkout.new(pricing_rules)

item_a = Item.new('A', 50)
item_b = Item.new('B', 30)
item_c = Item.new('C', 20)

puts 'Example 1 from readme file: A,B,C - Should return 100'
item = item_a
checkout.scan(item)

item = item_b
checkout.scan(item)

item = item_c
checkout.scan(item)

puts "Checkout Total: #{checkout.total}"

checkout.clear

puts 'Example 2 from readme file: B,A,B,B,A Should return 165'

item = item_b
checkout.scan(item)

item = item_a
checkout.scan(item)

item = item_b
checkout.scan(item)

item = item_b
checkout.scan(item)

item = item_a
checkout.scan(item)

puts "Checkout Total: #{checkout.total}"

checkout.clear

puts 'Example 3 from readme file: C,B,A,A,C,B,C Should return 189'

item = item_c
checkout.scan(item)

item = item_b
checkout.scan(item)

item = item_a
checkout.scan(item)

item = item_a
checkout.scan(item)

item = item_c
checkout.scan(item)

item = item_b
checkout.scan(item)

item = item_c
checkout.scan(item)

puts "Checkout total: #{checkout.total}"

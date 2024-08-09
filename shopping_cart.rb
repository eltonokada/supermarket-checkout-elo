require './lib/checkout'
require './lib/pricing_rule'
require './lib/quantity_discount'
require './lib/total_discount'
require './lib/item'

pricing_rule1 = QuantityDiscount.new('A', 2, 10)
pricing_rule2 = QuantityDiscount.new('B', 3, 15)
pricing_rule3 = TotalDiscount.new(10)

pricing_rules = [pricing_rule1, pricing_rule2, pricing_rule3]

checkout = Checkout.new(pricing_rules)

item = Item.new('C', 20)
checkout.scan(item)

item = Item.new('B', 30)
checkout.scan(item)

item = Item.new('A', 50)
checkout.scan(item)

item = Item.new('A', 50)
checkout.scan(item)

item = Item.new('C', 20)
checkout.scan(item)

item = Item.new('B', 30)
checkout.scan(item)

item = Item.new('C', 20)
checkout.scan(item)

price = checkout.total

p price


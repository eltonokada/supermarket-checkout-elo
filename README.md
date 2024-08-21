## Supermarket checkout

A supermarket sells the following items:

| Item | Price |
| --- | --- |
| A | £50 |
| B | £30 |
| C | £20 |

In addition, the supermarket offers some discounts:

- 2 items A for £90
- 3 items B for £75
- 10% off total basket cost for baskets worth over £200 (after previous discounts)

```ruby
checkout = Checkout.new(pricing_rules)
checkout.scan(item)
checkout.scan(item)
price = checkout.total
```

Here are some examples:

| Items | Basket total |
| --- | --- |
| A, B, C | £100 |
|  B, A, B, B, A | £165 |
| C, B, A, A, C, B, C | £189 |
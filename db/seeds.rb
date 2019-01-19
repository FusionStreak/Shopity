# frozen_string_literal: true

20.times do
  Product.create(
    title: Faker::Book.title,
    price: Faker::Number.decimal(2, 2),
    inventory_count: Faker::Number.number(3)
  )
end

20.times do
  Product.create(
    title: Faker::Food.fruits,
    price: Faker::Number.decimal(2, 2),
    inventory_count: Faker::Number.number(3)
  )
end

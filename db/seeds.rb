# frozen_string_literal: true

1.upto(10) do |i|
  Item.create!(
    original_price: Faker::Number.decimal(2),
    has_discount: Faker::Boolean.boolean,
    discount_percentage: Faker::Number.decimal(2)
  )
  p "ITEM #{i} : créé"
end

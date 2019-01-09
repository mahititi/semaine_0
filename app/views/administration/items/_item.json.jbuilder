# frozen_string_literal: true

json.extract! product, :id, :original_price, :has_discount, :discount_percentage, :created_at, :updated_at
json.url product_url(product, format: :json)

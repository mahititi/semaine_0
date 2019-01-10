# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  original_price      :float            not null
#  has_discount        :boolean          default(FALSE)
#  discount_percentage :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  name                :string
#

class Item < ApplicationRecord
  has_many :discount_percentage, through: :price
  belongs_to :original_price
  has_many :has_discount, through: :average_price

  # def price
  #  apply_discount(original_price)
  #  end

  # def apply_discount(price)
  #  return price if discount_percentage.nil?

  #  if discount_percentage.percentage.present?
  #   price -= ((price / 100) * discount_percentage.percentage)
  #  elsif has_discount.money.present?
  #    price -= has_discount.money
  #  end
  #  price < 0 ? 0 : price
  #  end
  def price(_has_discount)
    # item = Item.first
    # item.price
    price = (original_price - ((original_price / 100) * discount_percentage))
  end

  def self.average_price; end
  end

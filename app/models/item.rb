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
#

class Item < ApplicationRecord
   has_and_belongs_to_many :discount_percentage
   belongs_to :original_price
   has_and_belongs_to_many :has_discount

  def price
    item = Item.first
    item.price
  end
  def average_price
    self.average_price
  end
end

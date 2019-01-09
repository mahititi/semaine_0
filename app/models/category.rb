class Category < ApplicationRecord
   has_many :items, through: :category

  end

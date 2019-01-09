class Category < ApplicationRecord
   has_many :through items
end

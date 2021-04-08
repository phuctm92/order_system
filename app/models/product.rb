class Product < ApplicationRecord
  has_many :order_details, dependent: :delete_all
end

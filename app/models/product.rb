class Product < ApplicationRecord
  has_many :order_details, dependent: :delete_all

  validates :name, presence: true
  validates :price, presence: true
end

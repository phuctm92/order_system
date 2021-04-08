class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :delete_all
end

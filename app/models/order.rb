class Order < ApplicationRecord
  scope :order_by_date!, -> { order(order_date: :desc) }

  enum status: [:new_order, :confirming, :delivering, :done, :cancel]

  belongs_to :user
  has_many :order_details, dependent: :delete_all
  has_many :products, through: :order_details

  validates :status, presence: true

  after_initialize :set_default_values, if: :new_record?

  paginates_per 5

  private

  def set_default_values
    self.status ||= Order.statuses[:new_order]
    self.order_date ||= Time.current
  end
end

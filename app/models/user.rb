class User < ApplicationRecord
  has_many :orders, dependent: :delete_all

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[admin customer]
  after_initialize :set_default_role, if: :new_record?

  scope :customers, -> { where(role: :customer) }

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def set_default_role
    self.role ||= :customer
  end
end

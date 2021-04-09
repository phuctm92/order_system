class User < ApplicationRecord
  enum role: %i[admin customer]

  has_many :orders, dependent: :delete_all

  validates :email, presence: true, unique: true
  validates :password, presence: true

  after_initialize :set_default_role, if: :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def set_default_role
    self.role ||= User.role[:customer]
  end
end

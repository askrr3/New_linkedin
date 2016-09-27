class User2 < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :Description, presence: true

  has_many :networking, dependent: :destroy
  # has_many :networks, through :networking
end

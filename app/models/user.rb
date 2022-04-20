class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  ADMIN = "admin"
  CUSTOMER = "customer"

  ROLES = [ADMIN, CUSTOMER].freeze

  validates :role, inclusion: ROLES, presence: true
end

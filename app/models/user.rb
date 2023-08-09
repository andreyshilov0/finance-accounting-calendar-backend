class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :validatable

  has_many :user_incomes
  has_many :incomes, through: :user_incomes
  has_many :user_payments
  has_many :payments, through: :user_payments

  validates :email, presence: true, uniqueness: true
end

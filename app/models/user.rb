class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_and_belongs_to_many :incomes, join_table: :user_incomes
  has_and_belongs_to_many :payments, join_table: :user_payments

  validates :email, presence: true, uniqueness: true
end

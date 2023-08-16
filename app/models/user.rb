class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :incomes, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_and_belongs_to_many :income_categories
  has_and_belongs_to_many :payment_categories

  validates :email, presence: true, uniqueness: true
end

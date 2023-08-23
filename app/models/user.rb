class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :incomes, dependent: :destroy
  has_many :payments, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end

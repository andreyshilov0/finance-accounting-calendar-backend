class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_and_belongs_to_many :incomes, dependent: :destroy
  has_and_belongs_to_many :payments, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end

class IncomeCategory < ApplicationRecord
  has_many :incomes, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end

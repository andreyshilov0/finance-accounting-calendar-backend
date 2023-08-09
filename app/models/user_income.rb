class UserIncome < ApplicationRecord
  belongs_to :user
  belongs_to :income

  validates :amount, presence: true
end

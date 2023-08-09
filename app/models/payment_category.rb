class PaymentCategory < ApplicationRecord
  has_many :payments

  validates :name, presence: true, uniqueness: true
end

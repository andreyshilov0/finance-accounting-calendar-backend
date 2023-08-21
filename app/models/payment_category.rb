class PaymentCategory < ApplicationRecord
  has_many :payments, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end

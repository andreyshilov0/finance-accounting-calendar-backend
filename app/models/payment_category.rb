class PaymentCategory < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :nullify

  validates :name, presence: true, uniqueness: { scope: :user_id, message: 'already exist' }
end

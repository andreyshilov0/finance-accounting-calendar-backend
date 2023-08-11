class PaymentCategory < ApplicationRecord
  has_many :payments, dependent: :nullify

  validates :name, presence: true, uniqueness: true

  after_destroy :update_payments

  private

  def update_payments
    Payment.where(payment_category_id: id).update_all(payment_category_id: nil)
  end
end

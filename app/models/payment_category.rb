class PaymentCategory < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :payments, dependent: :nullify

  validates :name, presence: true, uniqueness: true

  before_destroy :handle_destroy

  private

  def handle_destroy
    payments.update_all(deleted: true, payment_category_id: nil)
  end
end

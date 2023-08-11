class Payment < ApplicationRecord
  belongs_to :payment_category, optional: true
  has_and_belongs_to_many :users

  validates :date, :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  before_destroy :handle_category_deletion

  private

  def handle_category_deletion
    return unless payment_category_id.present?

    payments_without_category = Payment.where(payment_category_id:,
                                              id:).or(Payment.where(
                                                        payment_category_id: nil
                                                      ))
    payments_without_category.update_all(payment_category_id: nil)
  end
end

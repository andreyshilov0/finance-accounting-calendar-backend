class Payment < ApplicationRecord
  belongs_to :payment_category, optional: true
  belongs_to :user

  validates :date, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  before_validation :set_name_from_category

  def set_name_from_category
    self.name = payment_category.name if payment_category.present?
  end
end

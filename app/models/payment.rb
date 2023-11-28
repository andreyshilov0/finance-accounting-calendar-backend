class Payment < ApplicationRecord
  belongs_to :payment_category, optional: true
  belongs_to :user

  validates :date, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  delegate :name, to: :payment_category, allow_nil: true

  def set_category_name
    self.name = payment_category&.name
  end
end

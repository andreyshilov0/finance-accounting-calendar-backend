class Income < ApplicationRecord
  belongs_to :income_category, optional: true
  belongs_to :user

  validates :date, :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  before_validation :set_name_from_category

  def set_name_from_category
    self.name = income_category.name if income_category.present?
  end
end

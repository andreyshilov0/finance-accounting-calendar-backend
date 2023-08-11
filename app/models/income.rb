class Income < ApplicationRecord
  belongs_to :income_category, optional: true
  has_and_belongs_to_many :users

  validates :date, :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  before_destroy :handle_category_deletion

  private

  def handle_category_deletion
    return unless income_category_id.present?

    incomes_without_category = Income.where(income_category_id:)
                                     .or(Income.where(income_category_id: nil))
    incomes_without_category.update_all(income_category_id: nil)
  end
end

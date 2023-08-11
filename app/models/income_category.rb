class IncomeCategory < ApplicationRecord
  has_many :incomes, dependent: :nullify

  validates :name, presence: true, uniqueness: true

  after_destroy :update_incomes

  private

  def update_incomes
    Income.where(income_category_id: id).update_all(income_category_id: nil)
  end
end

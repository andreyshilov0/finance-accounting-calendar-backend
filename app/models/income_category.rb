class IncomeCategory < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :incomes, dependent: :nullify

  validates :name, presence: true, uniqueness: true

  before_destroy :handle_destroy

  private

  def handle_destroy
    incomes.update_all(deleted: true, income_category_id: nil)
  end
end

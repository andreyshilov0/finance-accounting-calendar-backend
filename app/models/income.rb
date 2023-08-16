class Income < ApplicationRecord
  belongs_to :income_category, optional: true
  belongs_to :user

  validates :date, :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  before_destroy :handle_destroy

  private

  def handle_destroy
    update(deleted: true) if income_category_id.present?
  end
end

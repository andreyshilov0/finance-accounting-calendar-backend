class Income < ApplicationRecord
  belongs_to :income_category
  has_and_belongs_to_many :users

  validates :date, :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end

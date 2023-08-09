class Income < ApplicationRecord
  belongs_to :user
  belongs_to :income_category

  validates :date, :name, presence: true
end

class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :payment_category

  validates :date, :name, presence: true
end

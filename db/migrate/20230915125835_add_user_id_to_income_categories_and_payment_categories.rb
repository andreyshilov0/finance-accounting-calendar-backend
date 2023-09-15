class AddUserIdToIncomeCategoriesAndPaymentCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :income_categories, :user
    add_reference :payment_categories, :user
  end
end

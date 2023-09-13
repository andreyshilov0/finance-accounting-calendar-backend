module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :sign_in_user, mutation: Mutations::SignInUser
    field :create_income_category, mutation: Mutations::CreateIncomeCategory
    field :create_payment_category, mutation: Mutations::CreatePaymentCategory
    field :create_payment, mutation: Mutations::CreatePayment
    field :create_income, mutation: Mutations::CreateIncome
    field :update_income_category_name, mutation: Mutations::UpdateIncomeCategoryName
    field :update_payment_category_name, mutation: Mutations::UpdatePaymentCategoryName
    field :delete_income_category, mutation: Mutations::DeleteIncomeCategory
    field :delete_payment_category, mutation: Mutations::DeletePaymentCategory
  end
end

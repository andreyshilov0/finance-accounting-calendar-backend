module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :user, resolver: Queries::User
    field :income_categories, resolver: Queries::IncomeCategories
    field :payment_categories, resolver: Queries::PaymentCategories
    field :user_incomes, resolver: Queries::UserIncomes
    field :user_payments, resolver: Queries::UserPayments
  end
end

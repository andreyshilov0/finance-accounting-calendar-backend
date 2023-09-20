module Types
  class IncomeType < Types::BaseObject
    field :id, ID, null: false
    field :amount, Float, null: false
    field :date, GraphQL::Types::ISO8601Date, null: false
    field :name, String, null: false
    field :deleted, Boolean, null: false
    field :income_category, Types::IncomeCategoryType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

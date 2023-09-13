module Queries
  class IncomeCategories < Queries::BaseQuery
    type [Types::IncomeCategoryType], null: true

    def resolve
      IncomeCategory.all
    end
  end
end

module Queries
  class IncomeCategories < Queries::BaseQuery
    type [Types::IncomeCategoryType], null: true

    def resolve
      current_user.income_categories
    end
  end
end

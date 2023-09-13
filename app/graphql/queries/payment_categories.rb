module Queries
  class PaymentCategories < Queries::BaseQuery
    type [Types::PaymentCategoryType], null: true

    def resolve
      PaymentCategory.all
    end
  end
end

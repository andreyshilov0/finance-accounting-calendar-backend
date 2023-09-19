module Queries
  class PaymentCategories < Queries::BaseQuery
    type [Types::PaymentCategoryType], null: true

    def resolve
      current_user.payment_categories
    end
  end
end

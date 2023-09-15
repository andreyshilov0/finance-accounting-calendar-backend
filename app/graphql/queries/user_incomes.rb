module Queries
  class UserIncomes < Queries::BaseQuery
    type [Types::IncomeType], null: true

    def resolve
      current_user.incomes || (raise execution_error(I18n.t('failed_to_fetch_user_incomes')))
    end
  end
end

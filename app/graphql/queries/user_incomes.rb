module Queries
  class UserIncomes < Queries::BaseQuery
    type [Types::IncomeType], null: true

    def resolve
      incomes = current_user.incomes
      raise execution_error(I18n.t('failed_to_fetch_user_incomes')) if incomes.nil?

      incomes
    end
  end
end

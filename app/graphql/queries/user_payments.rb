module Queries
  class UserPayments < Queries::BaseQuery
    type [Types::PaymentType], null: true

    def resolve
      current_user.payments || (raise execution_error(I18n.t('failed_to_fetch_user_payments')))
    end
  end
end

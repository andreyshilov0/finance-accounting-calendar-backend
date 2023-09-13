module Queries
  class UserPayments < Queries::BaseQuery
    type [Types::PaymentType], null: true

    def resolve
      payments = current_user.payments
      raise execution_error(I18n.t('failed_to_fetch_user_payments')) if payments.nil?

      payments
    end
  end
end

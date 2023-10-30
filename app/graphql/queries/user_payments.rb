module Queries
  class UserPayments < Queries::BaseQuery
    type [Types::PaymentType], null: true

    argument :page, Integer, required: false, default_value: 1
    argument :per_page, Integer, required: false, default_value: 7
    argument :month_year, String, required: true

    def resolve(page:, per_page:, month_year:)
      start_date = Date.strptime(month_year, '%Y-%m')
      end_date = start_date.end_of_month
      payments = current_user.payments.where(date: start_date..end_date).order(created_at: :desc).page(page).per(per_page)
      payments.present? ? payments : (raise execution_error(I18n.t('failed_to_fetch_user_payments')))
    end
  end
end
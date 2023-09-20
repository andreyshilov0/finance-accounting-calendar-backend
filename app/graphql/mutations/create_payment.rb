module Mutations
  class CreatePayment < BaseMutation
    argument :amount, Float, required: true
    argument :name, String, required: true
    argument :payment_category_id, ID, required: true

    field :payment, Types::PaymentType, null: true

    def resolve(amount:, name:, payment_category_id:)
      new_payment = current_user.payments.build(amount:, name:, date: Time.current, payment_category_id:)

      if new_payment.save
        { payment: new_payment }
      else
        execution_error(I18n.t('create_payment_failed', errors: new_payment.errors.full_messages.join(', ')))

      end
    end
  end
end

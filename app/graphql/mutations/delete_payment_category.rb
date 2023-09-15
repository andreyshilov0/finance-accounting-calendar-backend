module Mutations
  class DeletePaymentCategory < BaseMutation
    argument :category_id, ID, required: true

    field :success, Boolean, null: false

    def resolve(category_id:)
      payment_category = PaymentCategory.find_by(id: category_id, user_id: current_user.id)

      return execution_error(I18n.t('category_not_found')) unless payment_category

      payment_category.destroy

      { success: true }
    end
  end
end

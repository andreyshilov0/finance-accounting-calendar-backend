module Mutations
  class DeletePaymentCategory < BaseMutation
    argument :category_id, ID, required: true

    field :success, Boolean, null: false

    def resolve(category_id:)
      payment_category = current_user.payment_categories.find_by(id: category_id)

      return execution_error(I18n.t('category_not_found')) unless payment_category

      payment_category.destroy

      { success: true }
    end
  end
end

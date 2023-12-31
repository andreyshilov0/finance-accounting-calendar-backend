module Mutations
  class UpdatePaymentCategoryName < BaseMutation
    argument :category_id, ID, required: true
    argument :new_name, String, required: true

    field :category, Types::PaymentCategoryType, null: true

    def resolve(category_id:, new_name:)
      payment_category = current_user.payment_categories.find_by(id: category_id)

      return execution_error(I18n.t('category_not_found')) unless payment_category

      existing_category = current_user.payment_categories.find_by(name: new_name)
      return execution_error(I18n.t('category_already_exists', name: new_name)) if existing_category

      payment_category.update(name: new_name)

      { category: payment_category }
    end
  end
end

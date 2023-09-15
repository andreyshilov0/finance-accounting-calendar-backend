module Mutations
  class DeleteIncomeCategory < BaseMutation
    argument :category_id, ID, required: true

    field :success, Boolean, null: false

    def resolve(category_id:)
      income_category = IncomeCategory.find_by(id: category_id, user_id: current_user.id)

      return execution_error(I18n.t('category_not_found')) unless income_category

      income_category.destroy

      { success: true }
    end
  end
end

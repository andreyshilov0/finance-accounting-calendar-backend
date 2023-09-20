module Mutations
  class DeleteIncomeCategory < BaseMutation
    argument :category_id, ID, required: true

    field :success, Boolean, null: false

    def resolve(category_id:)
      income_category = current_user.income_categories.find_by(id: category_id)

      return execution_error(I18n.t('category_not_found')) unless income_category

      income_category.destroy

      { success: true }
    end
  end
end

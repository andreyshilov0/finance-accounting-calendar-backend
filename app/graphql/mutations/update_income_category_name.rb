module Mutations
  class UpdateIncomeCategoryName < BaseMutation
    argument :category_id, ID, required: true
    argument :new_name, String, required: true

    field :category, Types::IncomeCategoryType, null: true

    def resolve(category_id:, new_name:)
      income_category = current_user.income_categories.find_by(id: category_id)

      return execution_error(I18n.t('category_not_found')) unless income_category

      existing_category = current_user.income_categories.find_by(name: new_name)
      return execution_error(I18n.t('category_already_exists', name: new_name)) if existing_category

      income_category.update(name: new_name)

      { category: income_category }
    end
  end
end

module Mutations
  class CreateIncomeCategory < BaseMutation
    argument :name, String, required: true

    field :category, Types::IncomeCategoryType, null: true

    def resolve(name:)
      existing_category = current_user.income_categories.find_by(name:)

      return execution_error(I18n.t('category_already_exists', name:)) if existing_category

      new_category = current_user.income_categories.build(name:)

      if new_category.save
        { category: new_category }
      else
        execution_error(I18n.t('create_category_failed', errors: new_category.errors.full_messages.join(', ')))
      end
    end
  end
end

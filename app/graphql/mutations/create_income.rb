module Mutations
  class CreateIncome < BaseMutation
    argument :amount, Float, required: true
    argument :name, String, required: true
    argument :income_category_id, ID, required: true

    field :income, Types::IncomeType, null: true

    def resolve(amount:, name:, income_category_id:)

      new_income = current_user.incomes.build(amount:, name:, date: Time.current, income_category_id:)

      if new_income.save
        { income: new_income }
      else
        execution_error(I18n.t('create_income_failed', errors: new_income.errors.full_messages.join(', ')))
      end
    end
  end
end

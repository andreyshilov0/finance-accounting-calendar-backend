class IncomeCategoriesController < ApplicationController
  def mark_deleted
    @income_category = IncomeCategory.find(params[:id])
    @income_category.incomes.update_all(deleted: true)
    # Решил оставить пока эти два метода без коллбэков для смены флажка, далее для graphql уже допишу всё что понадобиться
  end
end

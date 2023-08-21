class PaymentCategoriesController < ApplicationController
  def mark_deleted
    @payment_category = PaymentCategory.find(params[:id])
    @payment_category.payments.update_all(deleted: true)
    # Решил оставить пока эти два метода без коллбэков для смены флажка, далее для graphql уже допишу всё что понадобиться
  end
end

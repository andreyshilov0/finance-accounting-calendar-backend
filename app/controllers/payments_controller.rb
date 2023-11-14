class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @payments = current_user.payments.order(created_at: :desc).page(params[:page]).per(5)
    render 'financials/payments/index'
  end

  def create
    @payment = current_user.payments.build(payment_params)
    if @payment.save
      redirect_to payments_path
    else
      @payments = current_user.payments.page(params[:page]).per(5)
      render 'financials/payments/index'
    end
  end

  private

  def payment_params
    payment_category = PaymentCategory.find(params[:payment_category_id])
    {
      payment_category_id: payment_category.id,
      amount: params[:amount],
      date: Date.today,
      name: payment_category.name
    }
  end
end

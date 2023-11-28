class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @payments = current_user.payments.order(created_at: :desc).page(params[:page]).per(Constants::ITEMS_PER_PAGE)
    render 'financials/payments/index'
  end

  def create
    @payment = current_user.payments.build(payment_params)
    @payment.set_category_name
    if @payment.save
      redirect_to payments_path
    else
      @payments = current_user.payments.page(params[:page]).per(Constants::ITEMS_PER_PAGE)
      render 'financials/payments/index'
    end
  end

  private

  def payment_params
    {
      payment_category_id: params[:payment_category_id],
      amount: params[:amount],
      date: Date.today
    }
  end
end

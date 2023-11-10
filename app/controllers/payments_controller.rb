class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @payments = current_user.payments.page(params[:page]).per(5)
    render 'financials/payments/index'
  end

  def create
    @payment = current_user.payments.build(payment_params)
    
    if @payment.save
      redirect_to payments_path, notice: 'Payment was successfully created.'
    else
      render 'financials/payments/index'
    end
  end

  private

  def payment_params
    params.permit(:amount, :date, :name)
  end
end

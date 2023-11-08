class PaymentCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment_category, only: %i[edit update destroy]

  def index
    @payment_categories = current_user.payment_categories
  end

  def new
    @payment_category = current_user.payment_categories.build
  end

  def create
    @payment_category = current_user.payment_categories.build(payment_category_params)
    if @payment_category.save
      redirect_to payment_categories_path, notice: 'Категория расхода создана.'
    else
      render :new
    end
  end

  def update
    if @payment_category.update(payment_category_params)
      redirect_to payment_categories_path, notice: 'Категория расхода обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @payment_category.destroy
    redirect_to payment_categories_path, notice: 'Категория расхода удалена.'
  end

  private

  def set_payment_category
    @payment_category = current_user.payment_categories.find(params[:id])
  end

  def payment_category_params
    params.require(:payment_category).permit(:name)
  end
end

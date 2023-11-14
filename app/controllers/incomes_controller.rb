class IncomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @incomes = current_user.incomes.order(created_at: :desc).page(params[:page]).per(5)
    render 'financials/incomes/index'
  end

  def create
    @income = current_user.incomes.build(income_params)
    if @income.save
      redirect_to incomes_path
    else
      @incomes = current_user.incomes.page(params[:page]).per(5)
      render 'financials/incomes/index'
    end
  end

  private

  def income_params
    income_category = IncomeCategory.find(params[:income_category_id])
    {
      income_category_id: income_category.id,
      amount: params[:amount],
      date: Date.today,
      name: income_category.name
    }
  end
end

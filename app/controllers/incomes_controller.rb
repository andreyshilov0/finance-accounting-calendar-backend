class IncomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @incomes = current_user.incomes.order(created_at: :desc).page(params[:page]).per(Constants::ITEMS_PER_PAGE)
    render 'financials/incomes/index'
  end

  def create
    @income = current_user.incomes.build(income_params)
    @income.set_category_name
    if @income.save
      redirect_to incomes_path
    else
      @incomes = current_user.incomes.page(params[:page]).per(Constants::ITEMS_PER_PAGE)
      render 'financials/incomes/index'
    end
  end

  private

  def income_params
    {
      income_category_id: params[:income_category_id],
      amount: params[:amount],
      date: Date.today
    }
  end
end

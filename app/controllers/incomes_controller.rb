class IncomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @incomes = current_user.incomes.page(params[:page]).per(5)
    render 'financials/incomes/index'
  end

  def new
    @income = Income.new
    @income_categories = IncomeCategory.all
    @previous_incomes = current_user.incomes.last(5)
  end

  def create
    @income = current_user.incomes.build(income_params)
    if @income.save
      redirect_to settings_path, notice: 'Income was successfully created.'
    else
      render :new
    end
  end

  private

  def set_income
    @income = current_user.incomes.find(params[:id])
  end

  def income_params
    params.require(:income).permit(:income_category_id, :amount, :notes)
  end
end

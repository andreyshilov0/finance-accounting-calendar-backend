class IncomeCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :build_income_category, only: %i[new create]
  before_action :set_income_category, only: %i[edit update destroy]

  def index
    @income_categories = current_user.income_categories
  end

  def new
    render 'settings/incomes_category/new'
  end

  def create
    @income_category.assign_attributes(income_category_params)
    if @income_category.save
      redirect_to settings_path
    else
      render 'settings/incomes_category/new'
    end
  end

  def edit
    render 'settings/incomes_category/edit'
  end

  def update
    if @income_category.update(income_category_params)
      redirect_to settings_path
    else
      render 'settings/incomes_category/edit'
    end
  end

  def destroy
    @income_category.destroy
    redirect_to settings_path
  end

  private

  def build_income_category
    @income_category = current_user.income_categories.build
  end

  def set_income_category
    @income_category = current_user.income_categories.find(params[:id])
  end

  def income_category_params
    params.require(:income_category).permit(:name)
  end
end

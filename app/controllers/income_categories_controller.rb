class IncomeCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_income_category, only: %i[edit update destroy]

  def index
    @income_categories = current_user.income_categories
  end

  def new
    @income_category = current_user.income_categories.build
  end

  def create
    @income_category = current_user.income_categories.build(income_category_params)
    if @income_category.save
      redirect_to income_categories_path, notice: 'Категория дохода создана.'
    else
      render :new
    end
  end

  def update
    if @income_category.update(income_category_params)
      redirect_to income_categories_path, notice: 'Категория дохода обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @income_category.destroy
    redirect_to income_categories_path, notice: 'Категория дохода удалена.'
  end

  private

  def set_income_category
    @income_category = current_user.income_categories.find(params[:id])
  end

  def income_category_params
    params.require(:income_category).permit(:name)
  end
end

class SettingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @income_categories = current_user.income_categories
    @payment_categories = current_user.payment_categories

    @income_category = current_user.income_categories.build
    @payment_category = current_user.payment_categories.build
  end
end

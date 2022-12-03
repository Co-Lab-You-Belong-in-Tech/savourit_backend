class DashboardController < ApplicationController
  def index; end

  def meals
    @meals = Meal.where(desactivate: false)
  end

  def categories
    @categories = Category.all
  end
end

class DashboardController < ApplicationController
  def index; end

  def meals
    Rails.logger.debug params

    budget = if params[:budget].nil?
               100_000
             else
               params[:budget]
             end

    @meals = Meal.where('price <= :max ', max: budget).where(desactivate: false).order('RANDOM()')
  end

  def categories
    @categories = Category.all
  end
end

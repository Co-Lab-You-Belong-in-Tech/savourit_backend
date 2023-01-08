class DashboardController < ApplicationController
  def index; end

  def meals
    Rails.logger.debug params

    @meals = if params[:budget].nil?
               Meal.where(desactivate: false).order('RANDOM()')
             else
               Meal.where(desactivate: false).order(id: :asc)
             end
  end
end

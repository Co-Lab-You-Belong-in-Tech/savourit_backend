class DashboardController < ApplicationController
  def index; end

  def meals
    Rails.logger.debug params

    @meals = if params[:budget].nil?
               Meal.where(desactivate: false).order('RANDOM()')
             else
               Meal.where(desactivate: false)
             end
  end

  def categories
    @categories = Category.all
  end

  def categories_manage
    @categories1 = Category.all.order(name: :asc)
    @categories2 = Category.all.order(name: :asc)
  end

  def categories_remove
    Category.all.each do |c|
      c.destroy if c.meals.length.zero?
    end
    redirect_to categories_url
  end

  def merge_categories
    Rails.logger.debug params[:category1]
    Rails.logger.debug params[:category2]

    category1 = Category.find(params[:category1])
    category2 = Category.find(params[:category2])

    category1.meals.each do |m|
      m.categories.push(category2)
    end
    category1.destroy

    redirect_to categories_manage_url
  end
end

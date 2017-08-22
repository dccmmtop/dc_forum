class CategoriesController < ApplicationController
  def show
    @category=Category.find(params[:id])
    @topics=@category.topics
    @category
  end
end

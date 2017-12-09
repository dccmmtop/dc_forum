class CategoriesController < ApplicationController
  def show
    @category=Category.find(params[:id])
    @topics=@category.topics.order(read_count: :desc).page(params[:page]).per(10)
    @category
  end
end

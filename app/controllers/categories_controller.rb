class CategoriesController < ApplicationController
  before_action :require_login,:require_admin,only:[:create,:update,:edit,:destroy]
  def show
    @category=Category.find(params[:id])
    @topics=@category.topics.order(read_count: :desc).page(params[:page]).per(10)
    @category
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_url,notice: "添加成功!"
    else
      redirect_to categories_url,notice: "添加失败!"
    end
  end

  def update
   @category = Category.find(params[:id])
   @category.update(category_params)
    redirect_to categories_url,notice: "修改成功!"
 end

 def edit
  @category = Category.find(params[:id])
end

def index
  @categories = Category.order(topics_count: :desc).page(params[:page]).per(15)
end

def destroy
  Category.find(params[:id]).destroy
  redirect_to categories_url,notice: "删除成功!"
end

def category_params
  params.require(:category).permit(:name,:topics_count)
end
end

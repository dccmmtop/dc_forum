class CategoriesController < ApplicationController
  def show
    @category=Category.find(params[:id])
    @topics=@category.topics.order(read_count: :desc).page(params[:page]).per(10)
    @category
  end

    def create
    if params[:commit] == ("修改")
       update
    else
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        flash[:notice] = '添加成功!'
      else
       flash[:alert] = '添加失败!'
     end
     format.js{}
   end
   end
 end

 def update
  
   @category = Category.find(params[:category][:name].split("-")[1].to_i)
   params[:category][:name] = params[:category][:name].split("-")[0]
   @category.update(category_params)
   respond_to do |format|
     format.js {}
   end
 end

 def edit
    @category = Category.find(params[:id])
    respond_to do |format|
     format.js{}
   end
 end

  def index
    @categories = Category.order(topics_count: :desc)
  end

 def destroy
  Category.find(params[:id]).destroy
  respond_to do |format|
    format.html { head :no_content }
  end
end

  def category_params
    params.require(:category).permit(:name,:topics_count)
  end
end

module CategoriesHelper
  def all_categories 
    @categories= Category.all.order(topics_count: :desc)
  end
end

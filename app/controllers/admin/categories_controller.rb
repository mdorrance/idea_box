class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.name} has been added!"
      redirect_to admin_categories_path
    else
      flash[:danger] = "Name is missing!"
      redirect_to admin_new_category_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category.update(category_params)
    redirect_to admin_categories_path
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end

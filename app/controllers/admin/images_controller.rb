class Admin::ImagesController < Admin::BaseController
  before_action :set_image, only: [:edit, :update, :destroy]
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "#{@image.name} has been added!"
      redirect_to admin_images_path
    else
      flash[:danger] = "Name is missing!"
      redirect_to admin_new_image_path
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image.update(image_params)
    redirect_to admin_images_path
  end

  def destroy
    @image.destroy
    redirect_to admin_images_path
  end

  private
  def set_image
    @image = Image.find(params[:id])
  end
  def image_params
      params.require(:image).permit(:name, :url)
  end
end

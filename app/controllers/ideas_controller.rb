class IdeasController < ApplicationController
  before_action :set_idea, only: [:edit, :update, :destroy]
  def index
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      @idea.save_image(params[:idea][:image_list])
      flash[:success] = "#{@idea.title} has been added!"
      redirect_to current_user
    else
      flash[:danger] = "Title is missing!"
      redirect_to new_idea_path
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea.update(idea_params)
    redirect_to current_user
  end

  def destroy
    @idea.delete
    redirect_to current_user
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id, :image_list)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end

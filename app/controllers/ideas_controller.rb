class IdeasController < ApplicationController
  def index
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      flash[:success] = "#{@idea.title} has been added!"
      redirect_to current_user
    else
      flash[:danger] = "Title is missing!"
      redirect_to new_idea_path
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id)
  end
end

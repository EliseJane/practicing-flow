class CategoriesController < ApplicationController
  before_action :require_user

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @completed_todos = Todo.where(completed: true, user_id: current_user.id, category: @category).order(:duedate)
    @incomplete_todos = Todo.where(completed: false, user_id: current_user.id, category: @category).order(:duedate)
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      flash[:notice] = "#{@category.name} was created."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

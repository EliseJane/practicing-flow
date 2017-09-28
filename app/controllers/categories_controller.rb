class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  before_action :require_user
  before_action :require_same_user, only: [:show]

  def new
    @category = Category.new
  end

  def show
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

  def set_category
    @category = Category.find(params[:id])
  end

  def require_same_user
    user = @category.user

    if user != current_user
      flash[:notice] = "Can't do that."
      redirect_to root_path
    end
  end
end

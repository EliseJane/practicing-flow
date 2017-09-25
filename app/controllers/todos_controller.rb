require 'pry'

class TodosController < ApplicationController
  def index
    @todos = Todo.all.sort_by &:duedate
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(completed: params[:completed])
      flash[:notice] = 'This Todo was marked completed.'
      redirect_to todos_path
    else
      render :show
    end
  end

  def destroy
  end
end

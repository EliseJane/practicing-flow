require 'pry'

class TodosController < ApplicationController
  def index
    @complete = Todo.where(completed: true).sort_by &:duedate
    @incomplete = Todo.where(completed: false).sort_by &:duedate
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if params[:completed]
      if @todo.update(completed: params[:completed])
        flash[:notice] = 'This Todo was marked completed.'
        redirect_to todos_path
      else
        render :show
      end
    else
      @todo.duedate = Time.new(params[:year], params[:month], params[:day])
      if @todo.update(todo_params)
        flash[:notice] = 'This Todo was updated.'
        redirect_to todos_path
      else
        render :show
      end
    end
  end

  def destroy
  end

  private

  def todo_params
    params.require(:todo).permit!
  end
end

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
    binding.pry
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

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
    @todo = Todo.new(todo_params)
    @todo.duedate = Time.new(params[:year], params[:month], params[:day])

    if @todo.save
      flash[:notice] = 'A new todo was created.'
      redirect_to todos_path
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.duedate = Time.new(params[:year], params[:month], params[:day])
    
    if @todo.update(todo_params)
      flash[:notice] = 'This todo was updated.'
      redirect_to todos_path
    else
      render :edit
    end
  end

  def complete
    @todo = Todo.find(params[:id])

    if @todo.update(completed: params[:completed])
      flash[:notice] = 'This todo was marked completed.'
      redirect_to todos_path
    else
      render :edit
    end
  end

  def destroy
    @todo = Todo.find(params[:id])

    if @todo.destroy
      flash[:notice] = "#{@todo.title} has been deleted."
      redirect_to todos_path
    else
      render :show
    end
  end

  private

  def todo_params
    params.require(:todo).permit!
  end
end

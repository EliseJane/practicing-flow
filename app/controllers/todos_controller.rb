class TodosController < ApplicationController
  before_action :set_todo, except: [:new, :index, :create]

  def index
    @complete = Todo.where(completed: true).sort_by &:duedate
    @incomplete = Todo.where(completed: false).sort_by &:duedate
  end

  def show
  end

  def new
    @todo = Todo.new
    @todo.duedate = Time.now
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.duedate = Time.new(params[:year], params[:month], params[:day])

    if @todo.save
      flash[:notice] = "#{@todo.title} was created."
      redirect_to todos_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @todo.duedate = Time.new(params[:year], params[:month], params[:day])

    if @todo.update(todo_params)
      flash[:notice] = "#{@todo.title} was updated."
      redirect_to todos_path
    else
      render :edit
    end
  end

  def complete
    if @todo.update(completed: !@todo.completed)
      flash[:notice] = "#{@todo.title} was updated."
      redirect_to todos_path
    else
      render :edit
    end
  end

  def destroy
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

  def set_todo
    @todo = Todo.find(params[:id])
  end
end

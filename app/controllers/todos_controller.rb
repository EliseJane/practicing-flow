class TodosController < ApplicationController
  def index
    @todos = Todo.all.sort_by &:duedate
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
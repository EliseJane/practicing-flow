module ApplicationHelper
  def format_date(dt)
    dt.strftime("%b %e, %Y")
  end

  def completed_todo_style(todo)
    'text-decoration: line-through;' if todo.completed?
  end
end

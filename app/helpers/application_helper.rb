module ApplicationHelper
  def format_date(dt)
    dt.strftime("%b %e, %Y")
  end
end

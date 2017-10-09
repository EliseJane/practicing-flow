class Todo < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, optional: true

  validates_presence_of :title, :description, :duedate

  def title_digest
    if title.length > 10
      return title[0..9] + '...'
    end
    title
  end

  def self.due_today
    tomorrow = 1.day.since
    today = Time.now

    Todo.where("duedate < ? AND duedate >= ?", "#{tomorrow}", "#{today}").order(:duedate).to_a
  end
end

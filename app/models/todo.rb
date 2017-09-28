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
end

require 'spec_helper'
require 'rails_helper'

RSpec.describe "title_digest", type: :model do
  it "displays only first 10 chars of a title longer than 10 chars" do
    todo = Todo.new(title: "Clean My Bathroom", description: "blah", duedate: Time.now)

    expect(todo.title_digest).to eq('Clean My B...')
  end

  it "displays full title only if less than 10 chars" do
    todo = Todo.new(title: "Cook Food", description: "blah", duedate: Time.now)

    expect(todo.title_digest).to eq('Cook Food')
  end
end

RSpec.describe "due_today", type: :model do
  it 'displays all todos due within the next 24 hours' do
    user = User.create(username: 'alice', email: 'alice@ls.com', password: 'alice')
    todo = Todo.create!(title: "Clean My Bathroom", description: "blah", duedate: 2.hours.since, user: user)
    todo2 = Todo.create!(title: "Cook Lunch", description: 'food', duedate: 10.hours.since, user: user)

    expect(Todo.due_today).to eq([todo, todo2])
  end

  it 'displays empty array if no todos are due in the next 24 hours' do
    user = User.create(username: 'alice', email: 'alice@ls.com', password: 'alice')
    todo = Todo.create!(title: "Clean My Bathroom", description: "blah", duedate: 1.day.ago, user: user)
    todo2 = Todo.create!(title: "Cook Lunch", description: 'food', duedate: 3.days.since, user: user)
    todo3 = Todo.create!(title: "Cook Lunch Again", description: 'food', duedate: 2.days.since, user: user)

    expect(Todo.due_today).to eq([])
  end
end

require 'spec_helper'
require 'rails_helper'

RSpec.describe "title_digest", type: :model do
  it "displays only first 10 chars of a title longer than 10 chars" do
    todo = Todo.create(title: "Clean My Bathroom", description: "blah", duedate: Time.now)

    expect(todo.title_digest).to eq('Clean My B...')
  end

  it "displays full title only if less than 10 chars" do
    todo = Todo.create(title: "Cook Food", description: "blah", duedate: Time.now)

    expect(todo.title_digest).to eq('Cook Food')
  end
end

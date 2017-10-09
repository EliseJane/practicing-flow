require 'spec_helper'
require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'user can edit a todo', type: :feature do
  scenario 'user can see edit todo link' do
    user = User.create(username: 'alice', email: 'alice@ls.com', password: 'alice')
    Todo.create!(title: 'clean', description: 'cleaning', duedate: Time.now, user: user)

    visit(login_path)
    fill_in(:username, with: 'alice')
    fill_in(:password, with: 'alice')
    click_button('Log in')

    expect(page).to have_link('Edit')
  end

  scenario 'user can see edit form when click edit todo link' do
    user = User.create(username: 'alice', email: 'alice@ls.com', password: 'alice')
    Todo.create!(title: 'clean', description: 'cleaning', duedate: Time.now, user: user)

    visit(login_path)
    fill_in(:username, with: 'alice')
    fill_in(:password, with: 'alice')
    click_button('Log in')

    click_link('Edit')
    expect(page).to have_content('Edit Todo')
  end

  scenario 'user can see updated todo when submit changes' do
    user = User.create(username: 'alice', email: 'alice@ls.com', password: 'alice')
    Todo.create!(title: 'clean', description: 'cleaning', duedate: Time.now, user: user)

    visit(login_path)
    fill_in(:username, with: 'alice')
    fill_in(:password, with: 'alice')
    click_button('Log in')

    click_link('Edit')

    fill_in('todo[title]', with: 'cooking')
    click_button('Update Todo')

    expect(page).to have_content('cooking')
    expect(page).to_not have_content('clean')
  end
end

require 'spec_helper'
require 'rails_helper'
require 'capybara/rspec'

RSpec.feature "user can create todo", :type => :feature do
  scenario "displays create todo link when user logged in" do
    user = User.create(username: 'alice', email: 'alice@ls.com', password: 'alice')

    visit(login_path)
    fill_in(:username, with: 'alice')
    fill_in(:password, with: 'alice')
    click_button('Log in')

    expect(page).to have_content('Create New Todo')
  end

  scenario "does not display create todo link when used isn't logged in" do
    visit(todos_path)

    expect(page).to_not have_content('Create New Todo')
  end

  scenario "new todo form loaded when user clicks create new todo" do
    user = User.create(username: 'alice', email: 'alice@ls.com', password: 'alice')
    visit(login_path)
    fill_in(:username, with: 'alice')
    fill_in(:password, with: 'alice')
    click_button('Log in')

    click_link('Create New Todo')

    expect(page).to have_content('New Todo')
  end

  scenario "new todo listed under all todos after created by user" do
    user = User.create(username: 'alice', email: 'alice@ls.com', password: 'alice')
    visit(login_path)
    fill_in(:username, with: 'alice')
    fill_in(:password, with: 'alice')
    click_button('Log in')

    click_link('Create New Todo')

    fill_in('todo[title]', with: 'clean')
    fill_in('todo[description]', with: 'bedroom')
    click_button('Create Todo')

    expect(page).to have_content('clean')
  end

end

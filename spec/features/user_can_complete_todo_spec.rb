require 'spec_helper'
require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'user can toggle the completedness of a todo', type: :feature do
  scenario 'user can see complete todo link on todo show page' do
    user = User.create(username: 'alice', email: 'alice@ls.com', password: 'alice')
    Todo.create!(title: 'clean', description: 'cleaning', duedate: Time.now, user: user)

    visit(login_path)
    fill_in(:username, with: 'alice')
    fill_in(:password, with: 'alice')
    click_button('Log in')

    click_link('Show')
    expect(page).to have_link('Complete Todo')
  end

  scenario 'user can see strikethrough on todo after completing' do
    user = User.create(username: 'alice', email: 'alice@ls.com', password: 'alice')
    Todo.create!(title: 'clean', description: 'cleaning', duedate: Time.now, user: user)

    visit(login_path)
    fill_in(:username, with: 'alice')
    fill_in(:password, with: 'alice')
    click_button('Log in')

    click_link('Show')
    click_link('Complete Todo')

    expect(find('#complete')).to have_content('clean')
  end

  scenario 'user can see mark incomplete link on completed show page' do
    user = User.create(username: 'alice', email: 'alice@ls.com', password: 'alice')
    Todo.create!(title: 'clean', description: 'cleaning', duedate: Time.now, user: user, completed: true)

    visit(login_path)
    fill_in(:username, with: 'alice')
    fill_in(:password, with: 'alice')
    click_button('Log in')

    click_link('Show')
    expect(page).to have_link('Mark Incomplete')
  end

  scenario 'user cannot see strikethrough after marking todo incomplete' do
    user = User.create(username: 'alice', email: 'alice@ls.com', password: 'alice')
    Todo.create!(title: 'clean', description: 'cleaning', duedate: Time.now, user: user, completed: true)

    visit(login_path)
    fill_in(:username, with: 'alice')
    fill_in(:password, with: 'alice')
    click_button('Log in')

    click_link('Show')
    click_link('Mark Incomplete')

    expect(find('#complete')).to_not have_content('clean')
  end
end
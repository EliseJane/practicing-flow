# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  ['El', 'el@example.com', 'el'],
  ['Nitin', 'nitin@example.com', 'nitin'],
  ['Sunny', 'sunny@example.com', 'sunny']
]

todos = [
  ['Clean Bathroom', 'some description', Date.new(2018, 7, 4), 1], 
  ['Do Homework', 'some description', Date.new(2017, 11, 4), 2],
  ['Wash Car', 'some description', Date.new(2016, 2, 4), 3],
]


users.each do |username, email, password|
  User.create(username: username, email: email, password: password)
end

todos.each do |title, description, duedate, user_id|
  Todo.create(title: title, description: description, duedate: duedate, user_id: user_id)
end

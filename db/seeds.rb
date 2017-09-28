users = [
  ['El', 'el@example.com', 'el'],
  ['Nitin', 'nitin@example.com', 'nitin'],
  ['Sunny', 'sunny@example.com', 'sunny']
]

categories = ['Personal', 'Work', 'Family']

todos = [
  ['Clean Bathroom', 'some description', Date.new(2018, 7, 4)],
  ['Do Homework', 'some description', Date.new(2017, 11, 4)],
  ['Wash Car', 'some description', Date.new(2016, 2, 4)],
]

users.each do |username, email, password|
  User.create(username: username, email: email, password: password)
end

category_id = 1

(1..users.size).each do |user_id|
  categories.each do |category_name|
    Category.create(name: category_name, user_id: user_id)
  end

  todos.each do |title, description, duedate|
    Todo.create(title: title, description: description, duedate: duedate, user_id: user_id, category_id: category_id)
    category_id += 1
  end
end

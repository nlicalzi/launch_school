# Source: https://launchschool.com/exercises/16ab1e1f

def greetings(name, job)
  full_name = name.join(' ')
  title = job[:title]
  occupation = job[:occupation]
  "Hello, #{full_name}! Nice to have a #{title} #{occupation} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

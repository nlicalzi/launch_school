# Exercise 14, Intro to Programming, Launch School

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
                ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]
               ]

contacts = { "Joe Smith" => {}, "Sally Johnson" => {} }

info = [:email, :address, :phone]

# we want to go: contacts[0], info[0], contacts[0], info[1], etc...
contacts.each_with_index do |(name, hash), idx|
  info.each do |field|
    hash[field] = contact_data[idx].shift # "shift" is like pop, but from the left
  end
end

puts contacts

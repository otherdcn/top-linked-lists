require_relative 'lib/linked_list'

def test_linked_list(list)
  puts "Head node: #{list.head.value}"
  puts "Tail node: #{list.tail.value}"
  puts "Size of list: #{list.size}\n\n"

  puts list
end

puts "Created a linked list called pets..."
pets = LinkedList.new

#test_linked_list(pets)

puts "--------------------------------------------------------\n"

animal_shelter = %w[dog cat parrot hamster snake turtle]
puts "Appending (#{animal_shelter}), iteratively, to pets..."

animal_shelter.each do |animal|
  pets.append(animal)
end

test_linked_list(pets)

value = 'salamnder'
puts "Appending single item #{value}, to pets"
pets.append(value)
test_linked_list(pets)

puts "--------------------------------------------------------\n"

new_animals = %w[bearded\ dragon goldfish]
puts "Prepending #{new_animals}, iteratively, to pets..."

new_animals.each do |animal|
  pets.prepend(animal)
  test_linked_list(pets)
end

test_linked_list(pets)

puts "--------------------------------------------------------\n"

puts "Find pet at..."
index = 6
puts "Node at index #{index}: #{pets.at(index)[0].value}"

puts "--------------------------------------------------------\n"

puts "Pop from pets..."
puts "Pop from pets: #{pets.pop.value}"
puts "Pop from pets: #{pets.pop.value}"

test_linked_list(pets)

puts "--------------------------------------------------------\n"

puts "Contains and find in pets..."
value = "cat"
puts "Searching for #{value}..."

present_in_list = pets.contains(value)
index_in_list = pets.find(value)
puts "Present in pets' list: #{present_in_list}"
puts "Index in list if present: #{index_in_list ? index_in_list : "nil"}"

puts "--------------------------------------------------------\n"

puts "Insert animal at certain index in pets..."
value = "owl"
index = 5
puts "Insert #{value} at index #{index}"
pets.insert_at(value, index)

test_linked_list(pets)

puts "--------------------------------------------------------\n"

puts "Remove animal at certain index in pets..."
index = 3
puts "Remove node at index #{index}"
pets.remove_at(index)

test_linked_list(pets)

puts "--------------------------------------------------------\n"

puts "Shift from pets..."
puts "Shift: #{pets.shift.value}"
puts "Shift: #{pets.shift.value}\n\n"

test_linked_list(pets)


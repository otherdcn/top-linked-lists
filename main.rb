require_relative 'lib/linked_list'

def test_linked_list(list)
  puts "Head node: #{list.head.value}"
  puts "Tail node: #{list.tail.value}"
  puts "Size of list: #{list.size}\n\n"
end

pets = LinkedList.new
animal_shelter = %w[dog cat parrot hamster snake turtle]

animal_shelter.each do |animal|
  pets.append(animal)
end

test_linked_list(pets)

new_animals = %w[bearded\ dragon goldfish]

new_animals.each do |animal|
  pets.prepend(animal)
  test_linked_list(pets)
end

pets.append('salamnder')
test_linked_list(pets)

index = 6
puts "Node at index #{index}: #{pets.at(index).value}"

puts "Pop from pets: #{pets.pop.value}\n\n"

test_linked_list(pets)

puts "--------------\n"

puts "All nodes in the list: "
print pets

puts "--------------\n"

value = "cat"
puts "Searching for #{value}..."

present_in_list = pets.contains(value)
index_in_list = pets.find(value)
puts "Present in pets' list: #{present_in_list}"
puts "Index in list if present: #{index_in_list ? index_in_list : "nil"}"

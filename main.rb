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

pets.prepend('bearded dragon')

test_linked_list(pets)

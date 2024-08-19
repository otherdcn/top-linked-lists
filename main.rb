require_relative 'lib/linked_list'

pets = LinkedList.new
puts "New object (#{pets}) is of type #{pets.class}"
puts "Head node: #{pets.head}"
puts "Tail node: #{pets.tail}"
puts "Size of list: #{pets.size}"

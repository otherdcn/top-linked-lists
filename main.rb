require_relative 'lib/linked_list_singly'
require_relative 'lib/linked_list_doubly'

puts "Create and mess around with Linked Lists!\n\n"

list = LinkedList::Singly.new
operation = 1

=begin
until operation.zero?
  operations = [
    "Quit/Exit program",
    "Print list",
    "Add to end of list",
    "Add to start of list",
    "Return item at certain index",
    "Remove from end of list",
    "Remove from start of list",
    "Check if list contains a value",
    "Find index of value",
    "Insert item at specific index",
    "Remove iitem at specific index",
    "Reverse the list"
  ]

  operations.each_with_index do |operation, index|
    puts "#{index}. ".ljust(4) + operation
  end

  print "\n==> Select one of the above operations [type 0-11]: "
  operation = gets.chomp.to_i

  puts ""

  begin
    case operation
    when 0
      puts "Ending program..."
    when 1
      puts "Printing list..."

      puts list
    when 2
      puts "Adding to the end of list"

      print "Enter one item, or comma separted items: "
      user_values = gets.chomp.split(",")

      user_values.each { |item| list.append item }
    when 3
      puts "Adding to the start of list"

      print "Enter one item, or comma separted items: "
      user_values = gets.chomp.split(",")

      user_values.each { |item| list.prepend item }
    when 4
      puts "Returning an item at certain index"

      print "Enter index: "
      user_index = gets.chomp.to_i

      puts "Item at #{user_index}: #{list.at(user_index)[0].value}"
    when 5
      puts "Removing from the end of list"

      puts "Item removed/popped from end of list: #{list.pop.value}"
    when 6
      puts "Removing from the start of list"

      puts "Item removed/shifted from start of list: #{list.shift.value}"
    when 7
      puts "Checking if list contains a value"

      print "Enter value to check: "
      user_value = gets.chomp

      puts "Checking presence of #{user_value}: #{list.contains(user_value)}"
    when 8
      puts "Finding an index for a value"

      print "Enter value to check: "
      user_value = gets.chomp

      puts "Index for #{user_value}: #{list.find(user_value)}"
    when 9
      puts "Inserting an item at specific index"

      print "Enter value: "
      user_value = gets.chomp
      print "Enter index: "
      user_index = gets.chomp.to_i

      puts "Inserted #{user_value} at #{user_index}."
      list.insert_at(user_value, user_index)
    when 10
      puts "Removing an item at specific index"

      print "Enter index: "
      user_index = gets.chomp.to_i

      puts "Removing item at #{user_index}: #{list.remove_at(user_index).value}"
    when 11
      puts "Reversing the list"

      list.reverse!
      puts list
    else
      puts "Incorrect input #{operation}, type 0-11."
    end
  rescue StandardError => e
    puts e
  end

  puts "\n------------------------------------------\n\n"
end
=end

singly_list = LinkedList::Singly.new
operation = 1

animals = %w[dog cat parrot hasmter]

animals.each do |animal|
  singly_list.append animal
end

puts singly_list

puts "*****************************************"

def check_node_at(index, doubly_list)
  node = doubly_list.at(index)
  next_node = node.next_node ? node.next_node.value : "n/a"
  previous_node = node.previous_node ? node.previous_node.value : "n/a"

  puts "Node at index #{index}: #{node.value}"
  puts "Previous: #{previous_node}"
  puts "Next: #{next_node}"
end

def iterate_via_each(doubly_list)
  doubly_list.each do |node|
    #node = doubly_list.at(index)
    next_node = node.next_node ? node.next_node.value : "n/a"
    previous_node = node.previous_node ? node.previous_node.value : "n/a"

    puts "Node: #{node.value}"
    puts "Previous: #{previous_node}"
    puts "Next: #{next_node}"
    puts ""
  end
end

doubly_list = LinkedList::Doubly.new
operation = 1

animals.each do |animal|
  doubly_list.append animal
end

puts doubly_list

puts "----------------------------------------"

iterate_via_each(doubly_list)

puts doubly_list

puts "----------------------------------------"

index = 2
value = "horse"
puts "Insert #{value} at #{index}"
doubly_list.insert_at(value, index)

iterate_via_each(doubly_list)

puts ""

puts doubly_list

puts "----------------------------------------"

index = 2
popped_node = doubly_list.pop
puts "Popped node: #{popped_node.value}"

puts ""

iterate_via_each(doubly_list)

puts doubly_list

puts "----------------------------------------"

index = 4
removed_node = doubly_list.remove_at(index)

puts "Removed #{removed_node.value} at #{index}"

puts ""

puts doubly_list

iterate_via_each(doubly_list)

puts ""

puts doubly_list

puts "----------------------------------------"

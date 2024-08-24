require_relative 'lib/linked_list_singly'
require_relative 'lib/linked_list_doubly'

puts "Create and mess around with Linked Lists!\n\n"

list_choice = 0

until list_choice.between?(1,2)
  puts "1. Singly linked list"
  puts "2. Doubly linked list"
  print "Which linked list would you like to create: "
  list_choice = gets.chomp.to_i

  list = if list_choice == 1
           LinkedList::Singly.new
         elsif list_choice == 2
           LinkedList::Doubly.new
         else
           puts "Wrong input #{list_choice}, please type 1 or 2...\n\n"
         end
end

puts "\nCreated a #{list.class} Linked List!\n\n"
operation = 1

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
    "Reverse the list",
    "Examine node"
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

      if list.instance_of? LinkedList::Singly
        puts "Item at #{user_index}: #{list.at(user_index)[0].value}"
      elsif list.instance_of? LinkedList::Doubly
        puts "Item at #{user_index}: #{list.at(user_index).value}"
      end
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

      list.insert_at(user_value, user_index)

      puts "Inserted #{user_value} at #{user_index}."
    when 10
      puts "Removing an item at specific index"

      print "Enter index: "
      user_index = gets.chomp.to_i

      puts "Removing item at #{user_index}: #{list.remove_at(user_index).value}"
    when 11
      puts "Reversing the list"

      list.reverse!
      puts list
    when 12
      puts "Examining node"

      print "Enter index: "
      user_index = gets.chomp.to_i

      puts list.examine_node(user_index)
    else
      puts "Incorrect input #{operation}, type 0-11."
    end
  rescue StandardError => e
    puts e
  end

  puts "\n------------------------------------------\n\n"
end


require_relative 'node'

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    self.head = nil
    self.tail = nil
    self.size = 0
  end

  def empty?
    head.nil?
  end

  def append(value)
    node = Node.new(value)

    if empty?
      self.head = node
      self.tail = node # I am considering one element in the list as both a head and a tail
    elsif head.next_node.nil?
      self.head.next_node = node
      self.tail = node
    else
      self.tail.next_node = node
      self.tail = node
    end
    self.size += 1

    node
  end

  def prepend(value)
    node = Node.new(value)

    if empty?
      self.head = node
      self.tail = node # I am considering one element in the list as both a head and a tail
    elsif head.next_node.nil?
      node.next_node = head
      self.tail = head
      self.head = node
    else
      node.next_node = head
      self.head = node
    end
    self.size += 1

    node
  end

  def at(index)
    return nil if empty?
    raise IndexError, "Index out of bounds (#{index} > #{size})" if index > size
    return head if index == 1

    node = head
    previous_node = nil
    for i in 1...index
      parent_node = node
      node = node.next_node
    end

    [node, parent_node]
  end

  def pop
    return nil if empty?

    popped_node = tail # if only one element left in list, then tail will be pointing to head node as well
    self.tail = at(size-1)[0]
    self.tail.next_node = nil
    self.size -= 1

    popped_node
  end

  def search(value)
    node = head
    index = 1

    until node.nil?
      if value == node.value
        return [true, node, index]
      else
        node = node.next_node
        index += 1
      end
    end

    [false, nil, nil]
  end

  def contains(value)
    node_exist, node, index = search(value)

    node_exist
  end

  def find(value)
    node_exist, node, index = search(value)

    index
  end

  def to_s
    node = head
    traversal = ""

    traversal << "( #{node.value} ) -> "
    while node.next_node != nil
      node = node.next_node
      traversal << " ( #{node.value} ) -> "
    end
    traversal << " nil.\n"
  end

  def insert_at(value, index)
    return nil if empty?
    raise IndexError, "Index out of bounds (#{index} > #{size})" if index > size

    node_at_index, predecessor = at(index)


    node = Node.new(value)
    predecessor.next_node = node
    node.next_node = node_at_index
  end

  def remove_at(index)
    return nil if empty?
    raise IndexError, "Index out of bounds (#{index} > #{size})" if index > size

    node_at_index, predecessor = at(index)

    puts "*** Remove #{node_at_index.value} and then connect #{predecessor.value} to #{node_at_index.next_node.value} ***"

    predecessor.next_node = node_at_index.next_node
    node_at_index.next_node = nil
  end

  private :search
end


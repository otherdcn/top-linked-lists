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
end

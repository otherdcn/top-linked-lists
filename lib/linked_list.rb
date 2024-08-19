require_relative 'node'

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    self.head = nil
    self.tail = nil
    self.size = 0
  end
end

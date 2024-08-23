module LinkedList
  class SinglyLinkedNode
    attr_accessor :value, :next_node

    def initialize(value)
      self.value = value
      self.next_node = nil
    end
  end

  class DoublyLinkedNode < SinglyLinkedNode
    attr_accessor :previous_node

    def initialize(value)
      super value
      self.previous_node = nil
    end
  end
end

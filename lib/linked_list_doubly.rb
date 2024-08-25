module LinkedList 
  class Doubly < Singly
    def append(value, type = :doubly_linked)
      node = LINKED_LIST_TYPE[type].new(value)

      if empty?
        self.head = node
        self.tail = node # I am considering one element in the list as both a head and a tail
      else
        node.previous_node = tail
        self.tail.next_node = node
        self.tail = node
      end
      self.size += 1

      node
    end

    def prepend(value, type = :doubly_linked)
      node = LINKED_LIST_TYPE[type].new(value)

      if empty?
        self.head = node
        self.tail = node # I am considering one element in the list as both a head and a tail
      else
        node.next_node = head
        self.head.previous_node = node
        self.head = node
      end
      self.size += 1

      node
    end

    def pop
      return nil if empty?

      popped_node = tail # if only one element left in list, then tail will be pointing to head node as well

      self.tail = tail.previous_node
      self.tail.next_node = nil

      popped_node.next_node = nil
      popped_node.previous_node = nil

      self.size -= 1

      popped_node
    end

    def shift
      return nil if empty?

      shifted_node = head
      self.head = head.next_node
      self.head.previous_node = nil if head
      shifted_node.next_node = nil
      self.tail = nil if shifted_node == tail # in case of deleting the only node in list
      self.size -= 1

      shifted_node
    end

    def at(index)
      return nil if empty?

      raise IndexError, "Index out of bounds (#{index} > #{size})" if index > size
      return head if index == 1

      node = head
      for i in 1...index
        node = node.next_node
      end

      node
    end

    def insert_at(value, index, type = :doubly_linked)
      return nil if empty?

      raise IndexError, "Index out of bounds (#{index} > #{size})" if index > size

      node_at_index = at(index)

      return prepend(value) if node_at_index == head

      node = LINKED_LIST_TYPE[type].new(value)

      node_at_index.previous_node.next_node = node
      node.previous_node = node_at_index.previous_node
      node.next_node = node_at_index
      node_at_index.previous_node = node
      self.size += 1

      node
    end

    def remove_at(index)
      return nil if empty?

      raise IndexError, "Index out of bounds (#{index} > #{size})" if index > size

      node_at_index = at(index)

      if node_at_index == head
        self.head = head.next_node
        self.head.previous_node = nil
        node_at_index.next_node = nil

        self.tail = nil if node_at_index == tail # in case of deleting the only node in list

        self.size -= 1
      elsif node_at_index == tail
        self.pop
      else
        node_at_index.previous_node.next_node = node_at_index.next_node
        node_at_index.next_node.previous_node = node_at_index.previous_node
        node_at_index.previous_node = nil
        node_at_index.next_node = nil

        self.size -= 1
      end

      node_at_index
    end

    def reverse
      raise StandardError, "The reverse method is not yet avaialble for Doubly class"
    end

    def reverse!
=begin
      return nil if empty?

      list_size = size
      temp_head = shift
      temp_head.previous_node = head

      self.tail = temp_head

      until empty?
        node = shift

        node.previous_node = node.next_node
        node.next_node = temp_head

        temp_head = node
      end

      self.size = list_size
      self.head = temp_head
=end
      raise StandardError, "The reverse! method is not yet avaialble for Doubly class"
      nil
    end

    def examine_node(index)
      node_at_index = at(index)
      node = node_at_index.value
      previous_node = node_at_index.previous_node ? node_at_index.previous_node.value : "null"
      next_node = node_at_index.next_node ? node_at_index.next_node.value : "null"

      "Node: #{node}\nPrevious: #{previous_node}\nNext: #{next_node}"
    end
  end
end

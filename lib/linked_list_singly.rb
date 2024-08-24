require_relative 'node'

module LinkedList
  LINKED_LIST_TYPE = {
    singly_linked: SinglyLinkedNode,
    doubly_linked: DoublyLinkedNode
  }

  class Singly
    attr_accessor :head, :tail, :size

    def initialize
      self.head = nil
      self.tail = nil
      self.size = 0
    end

    def empty?
      head.nil?
    end

    def append(value, type = :singly_linked)
      node = LINKED_LIST_TYPE[type].new(value)

      if empty?
        self.head = node
        self.tail = node # I am considering one element in the list as both a head and a tail
      else
        self.tail.next_node = node
        self.tail = node
      end
      self.size += 1

      node
    end

    def prepend(value, type = :singly_linked)
      node = LINKED_LIST_TYPE[type].new(value)

      if empty?
        self.head = node
        self.tail = node # I am considering one element in the list as both a head and a tail
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
      return [head, nil] if index == 1

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

    def shift
      return nil if empty?

      shifted_node = head
      self.head = head.next_node
      shifted_node.next_node = nil
      self.tail = nil if shifted_node == tail # in case of deleting the only node in list
      self.size -= 1

      shifted_node
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

    def traverse
      return "" if empty?

      node = head
      traversal = ""

      traversal << "( #{node.value} ) -> "
      while node.next_node != nil
        node = node.next_node
        traversal << "( #{node.value} ) -> "
      end
      traversal << "nil.\n"
    end

    def to_s
      return traverse
    end

    def insert_at(value, index, type = :singly_linked)
      return nil if empty?

      raise IndexError, "Index out of bounds (#{index} > #{size})" if index > size

      node_at_index, predecessor = at(index)

      return prepend(value) if node_at_index == head

      node = LINKED_LIST_TYPE[type].new(value)
      predecessor.next_node = node
      node.next_node = node_at_index
      self.size += 1

      node
    end

    def remove_at(index)
      return nil if empty?

      raise IndexError, "Index out of bounds (#{index} > #{size})" if index > size

      node_at_index, predecessor = at(index)

      if node_at_index == head
        self.head = head.next_node
        node_at_index.next_node = nil
        self.tail = nil if node_at_index == tail # in case of deleting the only node in list

        self.size -= 1
      elsif node_at_index == tail
        self.pop
      else
        predecessor.next_node = node_at_index.next_node
        node_at_index.next_node = nil

        self.size -= 1
      end

      node_at_index
    end

    def each
      return nil if empty?

      node = head

      until node.nil?
        yield node

        node = node.next_node
      end
    end

    def reverse
      return nil if empty?

      new_linked_list = LinkedList.new

      self.each { |node| new_linked_list.prepend(node.value) }

      new_linked_list
    end

    def reverse!
      return nil if empty?

      # Within the method, the shift method is called multiple times
      # and each call decrements the size instance variable.
      # Therefore, we need to save current size and re-assign value
      # at the end
      list_size = size
      temp_head = shift

      self.tail = temp_head

      until empty?
        node = shift

        node.next_node = temp_head

        temp_head = node
      end

      self.size = list_size
      self.head = temp_head
    end

    def examine_node(index)
      node_at_index, _ = at(index)
      node = node_at_index.value
      next_node = node_at_index.next_node ? node_at_index.next_node.value : "null"

      "Node: #{node}\nNext: #{next_node}"
    end

    private :search
  end
end

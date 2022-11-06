class LinkedList
  attr_accessor :head, :tail

  def append(value)
    new_node = Node.new
    new_node.value = value
    if (head.nil? && tail.nil?)
      @tail = new_node
      @head = new_node
    else
      tail.next_node = new_node
      @tail = new_node
      tail.next_node = nil
    end
  end

  def prepend(value)
    new_node = Node.new
    new_node.value = value
    if head == nil
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = head
      @head = new_node
    end
  end

  def size
    count = 1
    if (head.nil? && tail.nil?)
      return 0
    end

    temp = head
    until temp == tail
      temp = temp.next_node
      count +=1
    end
    count
  end

  def at(index)
    temp = head
    (1...index).each do
      temp = temp.next_node
    end
    temp.value
  end

  def pop
    temp = head
    index = 1
    until index == (size-1)
      temp = temp.next_node
      index += 1
    end
    temp.next_node = nil
    @tail = temp
  end

  def contains?(value)
    temp = head
    until temp.next_node == nil
      return true if temp.value == value
      temp = temp.next_node
    end
    bool = temp.value == value ? true : false
  end

  def insert_at(value,index)
    temp = head
    i = 1
    until(i == (index-1))
      temp = temp.next_node
      i = i+1
    end
    p temp
    new_node = Node.new
    new_node.value = value
    temp_2 = temp.next_node
    temp.next_node = new_node
    new_node.next_node = temp_2
  end

end

class Node
 attr_accessor :value, :next_node
end

nLL = LinkedList.new
nLL.append(5)
nLL.append(6)
nLL.append(7)
nLL.pop
nLL.append(8)
nLL.prepend(9)
# p nLL.head
nLL.insert_at(99,2)
# nLL.insert_at(880,)
p nLL.head
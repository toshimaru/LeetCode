class Node
    attr_accessor :val, :next, :prev
    
    def initialize(val)
        @val = val
        @next = nil
        @prev = nil
    end
end    

class MyLinkedList
    def initialize()
        @head = nil
        @tail = nil
        @size = 0
    end

    def get(index)
        node = @head
        index.times do
            return -1 if node.next.nil?
            node = node.next
        end
        node&.val || -1
    end

    def add_at_head(val)
        node = Node.new(val)
        node.next = @head if @head
        @head = node
        @tail ||= node
        @size += 1
    end

    def add_at_tail(val)
        node = Node.new(val)
        @tail.next = node if @tail
        @tail = node
        @head ||= node
        @size += 1
    end

    def add_at_index(index, val)
        return if index > @size
        return add_at_head(val) if index == 0
        return add_at_tail(val) if index == @size
        
        new_node = Node.new(val)
        if @size == 0
            @head = new_node
            @tail = new_node
        else
            node = @head
            (index-1).times { node = node.next }
            orig_next = node.next
            node.next = new_node
            new_node.next = orig_next
        end
        @size += 1
    end

    def delete_at_index(index)
        return if index >= @size

        node = @head
        (index-1).times { node = node.next }
        if index == 0
            @head = @head.next
        else
            node.next = node.next&.next
            @tail = node if node.next.nil?
        end
        @size -= 1
    end
    
    private
    
    # for debug
    def print_node
        return puts('empty') if @size == 0

        ary = [@head.val]
        node = @head
        while node.next
            ary << node.next.val
            node = node.next
        end
        puts ary.join('->')
    end
end

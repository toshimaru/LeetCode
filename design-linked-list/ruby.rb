class Node
    attr_accessor :val, :next, :prev
    
    def initialize(val)
        @val = val
        @next = nil
        @prev = nil
    end
end

class MyLinkedList1
    def initialize()
        @head = nil
        @tail = nil
        @size = 0
    end

    def get(index)
        return -1 if index >= @size

        index.times.inject(@head) { |node| node.next }.val
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
            node = (index-1).times.inject(@head) { |node| node.next }
            orig_next = node.next
            node.next = new_node
            new_node.next = orig_next
        end
        @size += 1
    end

    def delete_at_index(index)
        return if index >= @size

        node = (index-1).times.inject(@head) { |node| node.next }
        if index == 0
            @head = @head.next
        else
            node.next = node.next&.next
            @tail = node if node.next.nil?
        end
        @size -= 1
    end
end

class MyLinkedList2
    def initialize()
        @dummy = Node.new(nil)
        @dummy.next = @dummy
        @dummy.prev = @dummy
        @size = 0
    end

    def get(index)
        return -1 if index >= @size

        get_node(index).val
    end

    def add_at_head(val)
        insert_before(@dummy.next, val)
    end

    def add_at_tail(val)
        insert_before(@dummy, val)
    end

    def add_at_index(index, val)
        return if index > @size

        insert_before(get_node(index), val)
    end

    def delete_at_index(index)
        return if index >= @size

        node = get_node(index)
        node.prev.next = node.next
        node.next.prev = node.prev
        @size -= 1
    end
    
    private
    
    def get_node(index)
        if index > @size / 2 
            (@size - index).times.inject(@dummy) { |node| node.prev }
        else
            index.times.inject(@dummy.next) { |node| node.next }
        end
    end
    
    def insert_before(node, val)
        new_node = Node.new(val)
        new_node.prev = node.prev
        new_node.next = node
        node.prev = new_node
        new_node.prev.next = new_node
        @size += 1
    end
end

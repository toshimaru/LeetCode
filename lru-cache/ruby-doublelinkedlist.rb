class Node
  attr_accessor :prev, :next
  attr_reader :key, :val

  def initialize(key, val)
    @key, @val = key, val
    @prev = @next = nil
  end
end

class LRUCache
  def initialize(capacity)
    @cap = capacity
    @hash = {}
    @left, @right = Node.new(0,0), Node.new(0,0)
    @left.next, @right.prev = @right, @left
  end

  def get(key)
    node = @hash[key]
    return -1 if node.nil?

    remove(node)
    insert(node)
    node.val
  end

  def put(key, value)
    remove(@hash[key]) if @hash[key]
    @hash[key] = Node.new(key, value)
    insert(@hash[key])

    if @hash.length > @cap
      lru = @left.next
      remove(lru)
      @hash.delete(lru.key)
    end
  end

  private

  def remove(node)
    prev, nxt = node.prev, node.next
    prev.next, nxt.prev = nxt, prev
  end

  def insert(node)
    prev, nxt = @right.prev, @right
    prev.next = nxt.prev = node
    node.next, node.prev = nxt, prev
  end
end

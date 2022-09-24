class LRUCache
  def initialize(capacity)
    @cap = capacity
    @hash = {}
  end

  def get(key)
    val = @hash.delete(key)
    val ? @hash[key] = val : -1
  end

  def put(key, value)
    @hash.delete(key)
    @hash[key] = value
    @hash.shift if @hash.size > @cap
  end
end

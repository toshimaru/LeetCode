# @param {Integer[]} stones
# @return {Integer}
def last_stone_weight(stones)
    while stones.size > 1
        stones.sort!
        a, b = stones.pop, stones.pop
        stones << a - b if a > b
    end
    stones[0] || 0
end

# Using MaxHeap
def last_stone_weight2(stones)
  heap = MaxHeap.new(stones)
  while heap.length > 1
    a, b = heap.pop, heap.pop
    heap << a - b if a > b
  end
  heap.pop || 0
end

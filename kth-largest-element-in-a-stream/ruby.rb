# 1. Naive solution (Timeout!)
class KthLargest
    def initialize(k, nums)
        @k = k
        @nums = nums
    end

    def add(val)
        @nums.push(val).sort!
        @nums[-@k]
    end
end

# 2. Using my own MinHeap
class KthLargest
    def initialize(k, nums)
        @k = k
        @heap = MinHeap.new
        nums.each { |num| add(num) }
    end

    def add(val)
        @heap.push(val)
        @heap.pop while @heap.size > @k
        @heap.peek
    end
end
# MinHeap class implemented by ChatGPT
class MinHeap
  def initialize
    @heap = []
  end

  def push(val)
    @heap << val
    bubble_up(@heap.size - 1)
  end

  def pop
    return nil if @heap.empty?

    swap(0, @heap.size - 1)
    min = @heap.pop
    bubble_down(0)
    min
  end

  def peek
    @heap[0]
  end

  def size
    @heap.size
  end

  private

  def bubble_up(index)
    parent_index = (index - 1) / 2
    return if index <= 0 || @heap[parent_index] <= @heap[index]

    swap(index, parent_index)
    bubble_up(parent_index)
  end

  def bubble_down(index)
    child_index = 2 * index + 1
    return if child_index >= @heap.size

    right_child_index = child_index + 1
    if right_child_index < @heap.size && @heap[right_child_index] < @heap[child_index]
      child_index = right_child_index
    end

    return if @heap[index] <= @heap[child_index]

    swap(index, child_index)
    bubble_down(child_index)
  end

  def swap(i, j)
    @heap[i], @heap[j] = @heap[j], @heap[i]
  end
end

# 3. Using MiniHeap provided by algorithm gem
class KthLargest
    def initialize(k, nums)
        @heap = MinHeap.new(nums.sort!.last(k))
        @k = k
    end

    def add(val)
        @heap << val
        @heap.pop if @heap.size > @k
        @heap.min
    end
end

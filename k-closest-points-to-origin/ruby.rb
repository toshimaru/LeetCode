def k_closest(points, k)
    points.sort_by! { |x, y| x**2 + y**2 }.first(k)
end

# Using MinHeap
def k_closest1(points, k)
    heap = MinHeap.new
    points.each do |x, y|
        heap.push(x**2 + y**2, [x, y]) # no need to do Math.sqrt
    end
    result = []
    k.times { result << heap.pop }
    result
end

# Using sort
def k_closest2(points, k)
    points.map.with_index do |(x, y), i|
        [x**2 + y**2, [x, y]]
    end.sort!.first(k).map { |_, point| point }
end

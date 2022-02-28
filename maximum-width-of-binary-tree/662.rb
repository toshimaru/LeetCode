# failed logic
# def _width_of_binary_tree(root)
#   nums = [root.left, root.right]
#   max = 1
#   while nums.any?
#     next_nums = []
#     nums.shift while nums.first.nil?
#     nums.pop while nums.last.nil?
#     max = nums.size if nums.size > max
#     nums.each do |_root|
#       next_nums << _root&.left << _root&.right
#     end
#     nums = next_nums
#   end
#   max
# end

def width_of_binary_tree(root)
  max = 1
  result = Hash.new { |h, k| h[k] = [] }
  q = []
  q << [root, 0, 1]

  until q.empty?
    curr, level, index = q.shift

    r_ary = result[level] << index
    max = [max, r_ary[-1] - r_ary[0] + 1].max if r_ary.size > 1

    q << [curr.left,  level + 1, 2 * index]     if curr.left
    q << [curr.right, level + 1, 2 * index + 1] if curr.right
  end
  max
end

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

p width_of_binary_tree TreeNode.new(1)
p width_of_binary_tree TreeNode.new(1, TreeNode.new(3), TreeNode.new(2))
p width_of_binary_tree TreeNode.new(1, TreeNode.new(3), TreeNode.new(2, nil, TreeNode.new(4)))

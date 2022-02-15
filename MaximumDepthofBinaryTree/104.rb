class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

def max_depth(root)
    return 0 if root.nil?
    return 1 if root.left.nil? && root.right.nil?

    1 + [max_depth(root.left), max_depth(root.right)].max
end

def debug_max_depth(root)
    return 0 if root.nil?
    return 1 if root.left.nil? && root.right.nil?
    x = max_depth(root.left)
    y = max_depth(root.right)
    puts "root: #{root.val}"
    puts "max_depth(root.left): #{x}"
    puts "max_depth(root.right): #{y}"
    1 + [x, y].max
end

t1 = TreeNode.new(0, TreeNode.new(9), TreeNode.new(20, TreeNode.new(15), TreeNode.new(17)))
t2 = TreeNode.new(0, TreeNode.new(9), nil)

p max_depth(t1)
puts "========"
p max_depth(t2)

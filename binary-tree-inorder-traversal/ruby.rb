# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}

# Solution 1
def inorder_traversal(root)
    ary = []
    traversal(root, ary)
    ary
end

def traversal(root, ary)
    return if root.nil?
    traversal(root.left, ary)
    ary << root.val
    traversal(root.right, ary)
end

# Solution 2
def inorder_traversal(root)
    return [] if root.nil?

    ary = []
    ary += inorder_traversal(root.left) if root.left
    ary << root.val
    ary += inorder_traversal(root.right) if root.right
    ary
end

# Solution 3
def inorder_traversal(root)
    stack = []
    res = []
    while stack.any? || root
        while root
            stack << root
            root = root.left
        end
        root = stack.pop
        res << root.val
        root = root.right
    end
    res
end

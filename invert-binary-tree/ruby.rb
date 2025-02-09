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
# @return {TreeNode}
# DSF
def invert_tree(root)
    return if root.nil?
    root.right, root.left = invert_tree(root.left), invert_tree(root.right)
    root
end

# BSF
def invert_tree(root)
    return if root.nil?

    queue = [root]
    while queue.any?
        node = queue.shift
        node.left, node.right = node.right, node.left
        queue << node.left if node.left
        queue << node.right if node.right
    end

    root
end

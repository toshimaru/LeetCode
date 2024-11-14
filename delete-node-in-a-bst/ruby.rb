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
# @param {Integer} key
# @return {TreeNode}
def delete_node(root, key)
    return root if root.nil?

    if key > root.val
        root.right = delete_node(root.right, key)
    elsif key < root.val
        root.left = delete_node(root.left, key)
    else
        return root.right if root.left.nil?
        return root.left  if root.right.nil?

        min_node   = min_value_node(root.right)
        root.val   = min_node.val
        root.right = delete_node(root.right, min_node.val)
    end
    root
end

def min_value_node(root)
    root = root.left while root.left
    root
end

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
# @param {Integer} target_sum
# @return {Boolean}
def has_path_sum(root, target_sum)
    @target_sum = target_sum
    dfs(root)
end

def dfs(node, sum = 0)
  return false if node.nil?

  sum += node.val
  return sum == @target_sum if node.left.nil? && node.right.nil?

  dfs(node.left, sum) || dfs(node.right, sum)
end

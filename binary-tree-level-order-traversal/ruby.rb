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
# @return {Integer[][]}
def level_order(root)
    return [] if root.nil?

    a = []
    q = [root] # Queue is also available
    while q.any?
        _a = []
        q.size.times do
            cur = q.shift
            _a << cur.val
            q << cur.left  if cur.left
            q << cur.right if cur.right
        end
        a << _a
    end
    a
end

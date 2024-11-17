# Solution1: recursive
def kth_smallest(root, k)
    @k = k
    find(root)
end

def find(root)
    return if root.nil?

    left = find(root.left)
    return left if left

    @k -= 1
    return root.val if @k == 0

    find(root.right)
end

# Solution1-A: recursive
def kth_smallest(root, k)
    find = ->(root) { root && (find[root.left] or
                              (k-=1) == 0 ? root.val : find[root.right]) }
    find[root]
end

# Solution2: stack
def kth_smallest(root, k)
    stack = []
    while stack.any? || root
        while root
            stack << root
            root = root.left
        end
        cur = stack.pop
        k -= 1
        return cur.val if k == 0
        root = cur.right
    end
    -1
end

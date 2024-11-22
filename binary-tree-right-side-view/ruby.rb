def right_side_view(root)
    return [] if root.nil?

    a = [root.val]
    q = [root]
    level = 0
    while q.any?
        q.size.times do
            curr = q.shift
            a[level] ||= curr.val
            q << curr.right if curr.right
            q << curr.left if curr.left
        end
        level += 1
    end
    a
end

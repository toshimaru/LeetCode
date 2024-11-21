def build_tree(preorder, inorder)
    return if preorder.empty? || inorder.empty?

    root = TreeNode.new(preorder.shift)
    mid = inorder.index(root.val)
    root.left  = build_tree(preorder[...mid], inorder[...mid])
    root.right = build_tree(preorder[mid..], inorder[mid+1..])
    root
end

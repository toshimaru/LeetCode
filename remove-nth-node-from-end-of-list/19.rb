# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def _remove_nth_from_end(head, n)
    ary = [head.val]
    ary << (head = head.next).val while head.next
    ary.delete_at(-n)
    ary
end

def remove_nth_from_end(head, n)
    pre = ListNode.new
    pre.next, left, right = head, pre, pre
    n.times { right = right.next }
    left, right = left.next, right.next while right.next
    left.next = left.next.next
    pre.next
end

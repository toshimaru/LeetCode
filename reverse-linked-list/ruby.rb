# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
    prev, curr = nil, head
    while curr
        nxt = curr.next
        curr.next = prev
        prev = curr
        curr = nxt        
    end
    prev
end

def ary_reverse_list(head)
    result = []
    while head
        result.unshift(head.val)
        head = head.next
    end
    result
end

def recursive_reverse_list(head)
    return if head.nil?

    new_head = head
    if head.next
        new_head = reverse_list(head.next)
        head.next.next = head
    end
    head.next = nil
    new_head
end

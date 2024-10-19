# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode[]} lists
# @return {ListNode}

# My original solution
# def merge_k_lists(lists)
#   ary = []
#   lists.each do |list|
#     while list
#       ary << list.val
#       list = list.next
#     end
#   end
#   ary.sort!
# end

def merge_k_lists(lists)
    while lists.size > 1
        lists = lists.each_slice(2).inject([]) { |memo, (a, b)| memo << merge(a, b) }
    end
    lists.first
end

def merge(a, b)
    dummy = ListNode.new
    tail = dummy
    while a && b
        if a.val < b.val
            tail.next = a
            a = a.next
        else
            tail.next = b
            b = b.next
        end
        tail = tail.next
    end
    tail.next = a if a
    tail.next = b if b
    dummy.next
end

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
def merge_k_lists(lists)
  ary = []
  lists.each do |list|
    while list
      ary << list.val
      list = list.next
    end
  end
  ary.sort!
end

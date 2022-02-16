class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

def merge_two_lists(list1, list2)
    ary = []
    while list1
        ary << list1.val
        list1 = list1.next
    end
    while list2
        ary << list2.val
        list2 = list2.next
    end
    ary.sort
end

def simple_merge_two_lists(list1, list2)
    if list1 && list2
        list1, list2 = list2, list1 if list1.val > list2.val
        list1.next = merge_two_lists(list1.next, list2)
    end
    list1 || list2
end

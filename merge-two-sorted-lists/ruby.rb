# Array
def merge_two_lists_to_array(list1, list2)
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

# Recursive
def recursive_merge_two_lists(list1, list2)
    if list1 && list2
        list1, list2 = list2, list1 if list1.val > list2.val
        list1.next = merge_two_lists(list1.next, list2)
    end
    list1 || list2
end

def merge_two_lists(list1, list2)
    dummy = ListNode.new
    tail = dummy

    while list1 && list2
        if list1.val > list2.val
            tail.next = list2
            list2 = list2.next
        else
            tail.next = list1
            list1 = list1.next
        end
        tail = tail.next
    end

    tail.next = list1 if list1
    tail.next = list2 if list2
    dummy.next
end

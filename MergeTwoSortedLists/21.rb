def merge_two_lists(list1, list2)
    ary = []
    loop do
        ary << list1.val
        list1 = list1.next
        break if list1.nil?
    end
    while list2
        ary << list2.val
        list2 = list2.next
    end
    ary.sort
end

# def merge_two_lists(list1, list2)
#     if list1 && list2
#         if list1.val > list2.val
#             list1, list2 = list2, list1
#         list1.next = merge_two_lists(list1.next, list2)
#     list1 || list2
# end

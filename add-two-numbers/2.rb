class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

def add_two_numbers(l1, l2)
    a = ""
    while l1
        a << l1.val.to_s
        l1 = l1&.next
    end
    b = ""
    while l2
        b << l2.val.to_s
        l2 = l2&.next
    end
    sum = a.reverse!.to_i + b.reverse!.to_i
    sum.to_s.reverse!.each_char.map(&:to_i)
end

def add_two_numbers2(l1, l2)
    n = answer = ListNode.new
    sum = 0
    while l1 || l2 || sum > 0
        if l1
            sum += l1.val
            l1 = l1.next
        end
        if l2
            sum += l2.val
            l2 = l2.next
        end
        sum, r = sum.divmod(10)
        n.next = ListNode.new(r)
        n = n.next
    end
    answer.next
end

l1 = ListNode.new(2, ListNode.new(4, ListNode.new(3)))
l2 = ListNode.new(3, ListNode.new(5, ListNode.new(1)))

puts add_two_numbers2(l1,l2)

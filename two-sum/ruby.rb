def two_sum(nums, target)
    answer = []
    nums.count.times { |n1|
        nums.count.times { |n2|
            next if n1 == n2
            answer = [n1, n2] and break if nums[n1] + nums[n2] == target
        }
        break answer unless answer.empty?
    }
end

p two_sum([11, 15, 2, 7], 9)


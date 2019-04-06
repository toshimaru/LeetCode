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

def two_sum2(nums, target)
    nums.count.times { |n|
        if index = nums.index(target - nums[n])
            break [n, index] unless n == index
        end
    }
end

p two_sum([11, 15, 2, 7], 9)
p two_sum2([11, 15, 2, 7], 9)

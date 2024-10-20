# !Time Limit Exceeded!
def two_sum1(nums, target)
    answer = []
    nums.count.times { |n1|
        nums.count.times { |n2|
            next if n1 == n2
            return [n1, n2] if nums[n1] + nums[n2] == target
        }
    }
end

def two_sum2(nums, target)
    nums.count.times { |n|
        if index = nums.index(target - nums[n])
            return [n, index] unless n == index
        end
    }
end

def two_sum(nums, target)
    hash = {}
    nums.each_with_index { |num, i|
        if val = hash[num]
            return [val, i]
        else
            hash[target - num] = i
        end
    }
end

p two_sum([11, 15, 2, 7], 9)
p two_sum1([11, 15, 2, 7], 9)
p two_sum2([11, 15, 2, 7], 9)

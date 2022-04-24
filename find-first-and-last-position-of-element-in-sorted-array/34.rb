# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
    l, h, min, max = 0, nums.size - 1, -1, -1
    while l <= h
        m = (l + h) / 2
        if nums[m] == target
            min, max = m, m
            min -= 1 while min > 0 && nums[min-1] == target
            max += 1 while nums[max+1] == target
            break
        end
        target > nums[m] ? l = m + 1 : h = m - 1
    end
    [min, max]
end

p search_range([5,7,7,8,8,10], 6)
p search_range([1], 1)
p search_range([1,1], 1)
p search_range([1,1,1], 1)
p search_range([1,4], 4)

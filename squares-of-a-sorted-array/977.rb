# @param {Integer[]} nums
# @return {Integer[]}
def _sorted_squares(nums)
    nums.map! {|n| n**2 }.sort!
end

# @param {Integer[]} nums
# @return {Integer[]}
def sorted_squares(nums)
    len = nums.size
    r = []
    i, j = 0, len - 1

    len.times do
        head = nums[i]
        tail = nums[j]
        if head.abs > tail.abs
            r.unshift head**2
            i += 1
        else
            r.unshift tail**2
            j -= 1
        end
    end
    r
end

nums = [-4,-1,0,3,10]
p sorted_squares(nums)

nums = [-7,-3,2,3,11]
p sorted_squares(nums)

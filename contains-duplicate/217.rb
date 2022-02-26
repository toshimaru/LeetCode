# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    nums.size != nums.uniq.size
end

# Better answer
def contains_duplicate(nums)
    h = {}
    nums.each do |num|
        return true if h[num]
        h[num] = true
    end
    false
end

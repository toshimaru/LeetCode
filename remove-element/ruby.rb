# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
    nums.delete(val)
    nums.length
end

# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element2(nums, val)
    idx = 0
    nums.each do |n|
        unless n == val
            nums[idx] = n
            idx += 1
        end
    end
    idx
end

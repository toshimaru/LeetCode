# @param {Integer[]} nums
# @return {Integer}
def online_remove_duplicates(nums)
    (nums.uniq! || nums).length
end

# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
    idx = 1
    nums.each_with_index do |n, i|
        next if i == 0

        unless n == nums[i-1]
            nums[idx] = n
            idx += 1
        end
    end
    idx
end

# def three_sum(nums)
#     nums.combination(3).each do |_nums|
#         r << _nums.sort if _nums.sum == 0
#     end
#     r.uniq
# end

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  r = []
  len = nums.sort!.size
  (len - 2).times do |i|
    if i == 0 || (i > 0 && nums[i] != nums[i - 1])
      left, right, expected_sum = i + 1, len - 1, 0 - nums[i]
      while left < right
        sum = nums[left] + nums[right]
        left  += 1 and next if sum < expected_sum
        right -= 1 and next if sum > expected_sum

        r << [nums[i], nums[left], nums[right]]
        left  += 1 while left < right && nums[left]  == nums[left + 1]
        right -= 1 while left < right && nums[right] == nums[right - 1]
        left  += 1
        right -= 1
      end
    end
  end
  r
end

nums = [-1, 0, 1, 2, -1, -4]
p three_sum(nums)
nums = [0,0,0]
p three_sum(nums)

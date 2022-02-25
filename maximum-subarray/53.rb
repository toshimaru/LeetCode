# @param {Integer[]} nums
# @return {Integer}
# def max_sub_array(nums)
#   max = nums.max
#   size = nums.size
#   size.times do |i|
#     (i+1..size).each do |j|
#       ary = nums[i..j]
#       sum = ary.sum
#       max = sum if sum > max
#     end
#   end
#   max
# end

def max_sub_array(nums)
  max = sum = nums[0]
  nums[1..].each do |num|
    sum = [num, sum+num].max
    max = sum if sum > max
  end
  max
end

nums = [-2,1,-3,4,-1,2,1,-5,4]
p max_sub_array(nums)
nums = [2, 9,-1,100]
p max_sub_array(nums)


# @param {Integer[]} nums
# @return {Integer[][]}

# !Time Limit Exceeded!
def easy_three_sum(nums)
  nums.combination(3).each_with_object([]) do |nums_comb, ary|
    ary << nums_comb.sort if nums_comb.sum == 0
  end.uniq
end

# def three_sum(nums)
#   r = []
#   len = nums.sort!.size
#   (len - 2).times do |i|
#     next if i > 0 && nums[i] == nums[i - 1]

#     left, right, expected_sum = i + 1, len - 1, 0 - nums[i]
#     while left < right
#       sum = nums[left] + nums[right]
#       left  += 1 and next if sum < expected_sum
#       right -= 1 and next if sum > expected_sum

#       r << [nums[i], nums[left], nums[right]]
#       left  += 1 while left < right && nums[left]  == nums[left + 1]
#       right -= 1 while left < right && nums[right] == nums[right - 1]
#       left  += 1
#       right -= 1
#     end
#   end
#   r
# end

def three_sum(nums)
  a = []
  size = nums.sort!.size
  nums.each_with_index do |num, i|
    next if i > 0 && num == nums[i - 1]

    left, right = i + 1, size - 1
    while left < right
      sum = num + nums[left] + nums[right]
      if sum > 0
        right -= 1
      elsif sum < 0
        left += 1
      else
        left_num, right_num = nums[left], nums[right]
        a << [num, left_num, right_num]
        begin
          left += 1
        end until left_num != nums[left]
        begin
          right -= 1
        end until right_num != nums[right]
      end
    end
  end
  a
end

require 'set'
def three_sum_with_set(nums)
  r = Set.new
  len = nums.sort!.size
  (len - 2).times do |i|
    left, right = i + 1, len - 1
    while left < right
      sum = nums[i] + nums[left] + nums[right]
      if sum == 0
        r << [nums[i], nums[left], nums[right]]
        left += 1
        right -= 1
      elsif sum > 0
        right -= 1
      else
        left += 1
      end
    end
  end
  r.to_a
end

require 'benchmark/ips'

Benchmark.ips do |x|
  nums = [-1, 0, 1, 2, -1, -4]
  x.report('easy_three_sum') { easy_three_sum(nums) }
  x.report('three_sum') { three_sum(nums) }
  x.report('three_sum_with_set') { three_sum_with_set(nums) }
  x.compare!

  nums = [0, 0, 0, 0, 0]
  x.report('easy_three_sum') { easy_three_sum(nums) }
  x.report('three_sum') { three_sum(nums) }
  x.report('three_sum_with_set') { three_sum_with_set(nums) }
  x.compare!

  nums = [3, 0, -2, -1, 1, 2]
  x.report('easy_three_sum') { easy_three_sum(nums) }
  x.report('three_sum') { three_sum(nums) }
  x.report('three_sum_with_set') { three_sum_with_set(nums) }
  x.compare!
end

# p three_sum(nums)
# p three_sum_with_set(nums)
# p three_sum_with_set(nums)

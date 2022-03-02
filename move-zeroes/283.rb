# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes1(nums)
  left = 0
  right = -1
  nums.dup.each do |num|
    if num.zero?
      nums[right] = 0
      right -= 1
    else
      nums[left] = num
      left += 1
    end
  end
end

def move_zeroes2(nums)
  len = nums.size
  nums.reject!(&:zero?)&.fill(0, nums.size...len)
end

def move_zeroes3(nums)
  i = 0
  nums.size.times do |j|
    if nums[j] != 0
      nums[i], nums[j] = nums[j], nums[i]
      i += 1
    end
  end
end

##########################3

require 'benchmark/ips'

Benchmark.ips do |x|
  ARY = [73348,66106,-85359,53996,18849,-6590,-53381,-86613,-41065,83457,0]

  x.report('move_zeroes1') do
    move_zeroes1(ARY)
  end
  x.report('move_zeroes2') do
    move_zeroes2(ARY)
  end
  x.report('move_zeroes3') do
    move_zeroes3(ARY)
  end
  x.compare!
end

def _search(nums, target)
  nums.index(target) || -1
end

def search(nums, target)
  left, right = 0, nums.size - 1
  while left <= right
    mid = (left + right) / 2
    mid_num = nums[mid]
    if target == mid_num
      return mid
    elsif target < mid_num
      right = mid - 1
    else
      left = mid + 1
    end
  end
  -1
end

nums = [-1,0,3,5,9,12]
target = 9
puts search(nums, target)

nums = [-1,0,3,5,9,12]
target = 2
puts search(nums, target)

nums = [2]
target = 2
puts search(nums, target)

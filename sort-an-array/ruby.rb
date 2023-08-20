# @param {Integer[]} nums
# @return {Integer[]}
# def sort_array1(nums)
  # nums.sort!
# end

def sort_array(nums)
  return nums if nums.size <= 1

  mid = nums.size / 2
  left = sort_array(nums[...mid])
  right = sort_array(nums[mid..])
  merge(left, right)
end

def merge(ary1, ary2)
  i, j, merged_ary = 0, 0, []

  while i < ary1.size && j < ary2.size
    if ary1[i] < ary2[j]
      merged_ary << ary1[i]
      i += 1
    else
      merged_ary << ary2[j]
      j += 1
    end
  end

  while i < ary1.size
    merged_ary << ary1[i]
    i += 1
  end
  while j < ary2.size
    merged_ary << ary2[j]
    j += 1
  end
  merged_ary
end

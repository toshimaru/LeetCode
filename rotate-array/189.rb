def rotate(nums, k)
    nums.unshift(*nums.pop(k % nums.size))
end

def rotate1(nums, k)
    k.times { nums.unshift(nums.pop) }
end

def rotate2(nums, k)
    k -= nums.size while k > nums.size
    nums.unshift(*nums.pop(k))
end

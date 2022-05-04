def permute(nums)
  return [nums] if nums.size == 1

  result = []
  nums.each do |num|
    num = [num]
    l = permute(nums - num)
    result += l.map { |ary| num | ary }
  end
  result
end

p permute([3, 4, 0])
p permute([1,2])

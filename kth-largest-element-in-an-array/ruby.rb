# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# def find_kth_largest(nums, k)
  # nums.max(k)[-1]
# end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  pivot = nums.sample
  lesser, equals, greater = [], [], []
  nums.each do |i|
    if i > pivot then greater << i
    elsif i < pivot then lesser << i
    else equals << i
    end
  end

  g_size, eg_size = greater.size, equals.size + greater.size
  if    k <= g_size then find_kth_largest(greater, k)
  elsif k > eg_size then find_kth_largest(lesser, k - eg_size)
  else  equals[0]
  end
end

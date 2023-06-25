# @param {Integer[]} nums
# @return {Integer[]}
def decompress_rl_elist(nums)
  answer = []
  0.step(nums.size-1, 2) { |i| answer.push(*[nums[i+1]] * nums[i]) }
  answer
end

# @param {Integer[]} nums
# @return {Integer[]}
def decompress_rl_elist1(nums)
  answer, idx = [], 0
  while idx < nums.size
    answer.push(*Array.new(nums[idx]) { nums[idx+1] })
    idx += 2
  end
  answer
end

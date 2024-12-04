# 1. DFS
def subsets(nums)
    @nums, @res, @subset = nums, [], []
    dfs
    @res
end

def dfs(i = 0)
    return @res << @subset.dup if i >= @nums.size

    @subset << @nums[i]
    dfs(i + 1)
    @subset.pop
    dfs(i + 1)
end

# 2. Use combination
def subsets(nums)
    (0..nums.size).inject([]) { |ary, i| ary += nums.combination(i).to_a }
end

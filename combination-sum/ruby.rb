def combination_sum(candidates, target)
    @a = []
    @candidates = candidates
    @size = candidates.size
    @target = target
    
    dfs(0, [], 0)
    @a
end

def dfs(i, current, sum)
    return @a << current.dup if sum == @target
    return if sum > @target

    current << @candidates[i]
    dfs(i, current, sum + @candidates[i])
    current.pop
    dfs(i + 1, current, sum) if i + 1 < @size
end


=begin
p combination_sum([2,3,6,7], 7) # [[2,2,3],[7]]
puts "-----------------"
p combination_sum([9,3,5,2], 8) 
=end

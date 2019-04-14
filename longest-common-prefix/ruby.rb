def longest_common_prefix(strs)
    return "" if strs.empty?
    min = strs.map(&:length).min
    word = strs.pop
    a = 0
    min.times { |i|
        if strs.all? { |w| w[i] == word[i] }
            a = i + 1
        else
            break
        end
    }
    word[0, a]
end

p longest_common_prefix(["aca","cba"])
p longest_common_prefix(["a"])

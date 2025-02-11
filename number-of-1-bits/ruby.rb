# @param {Integer} n
# @return {Integer}
def hamming_weight(n)
    n.to_s(2).count('1')
end

def hamming_weight1(n)
    n.to_s(2).each_char.inject(0) { |i, x| i += x.to_i }
end

def hamming_weight2(n)
    32.times.inject(0) do |res, i|
        res += 1 if (1 << i) & n > 0
        res
    end
end

def hamming_weight3(n)
    res = 0
    while n > 0 
        res += n & 1
        n >>= 1
    end
    res
end

# optimal
def hamming_weight4(n)
    res = 0
    while n > 0
        n &= n - 1
        res += 1
    end
    res
end


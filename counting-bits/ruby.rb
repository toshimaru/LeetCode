# @param {Integer} n
# @return {Integer[]}
def count_bits(n)
    (0..n).map { |i| i.to_s(2).count('1') } 
end

def count_bits1(n)
    (0..n).map do |i|
        cnt = 0
        while i > 0
            i &= i - 1
            cnt += 1
        end
        cnt
    end
end

# Optimal solution
def count_bits2(n)
    dp = Array.new(n + 1, 0)
    (1..n).each { |i| dp[i] = dp[i >> 1] + (i & 1) } 
    dp
end

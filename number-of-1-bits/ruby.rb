# @param {Integer} n
# @return {Integer}
def hamming_weight(n)
    n.to_s(2).count('1')
end

def hamming_weight1(n)
    n.to_s(2).each_char.inject(0) { |i, x| i += x.to_i }
end

def reverse_bits1(n)
    n.to_s(2).rjust(32, "0").reverse.to_i(2)
end

def reverse_bits2(n)
    bits = n.digits(2)
    while bits.size < 32 do
        bits << 0
    end
    bits.join.to_i(2)
end

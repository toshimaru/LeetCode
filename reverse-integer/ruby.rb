BASE = 2 ** 31
INT_MAX = BASE - 1
INT_MIN = BASE * -1

def reverse(x)
    if x.positive?
        a = x.to_s.reverse!.to_i
        a > INT_MAX ? 0 : a
    else
        a = x.to_s.reverse!.to_i * -1
        a < INT_MIN ? 0 : a
    end
end

puts reverse 12345

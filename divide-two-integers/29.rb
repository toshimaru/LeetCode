# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
MAX = 2147483647
def divide(dividend, divisor)
    plus_or_minus = (dividend < 0) ^ (divisor < 0) ? -1 : 1
    dividend, divisor, times = dividend.abs, divisor.abs, 0
    while dividend >= divisor
        d, t = divisor, 1
        while dividend >= d
            dividend -= d
            times += t
            t <<= 1
            d <<= 1
        end
    end
    [times * plus_or_minus, MAX].min
end

puts divide(10, 3)
puts divide(7, -3)
puts divide(20, 2)
puts divide(100, 7)

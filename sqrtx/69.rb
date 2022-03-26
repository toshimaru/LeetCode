# @param {Integer} x
# @return {Integer}
def _my_sqrt(x)
  Math.sqrt(x).to_i
end

def my_sqrt(x)
  r = x
  r = (r + x/r) / 2 while r * r > x
  r
end

puts my_sqrt(9)
puts my_sqrt(10)

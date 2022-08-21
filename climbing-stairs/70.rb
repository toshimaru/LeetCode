# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  a, b = n.divmod 2
  ans = 0
  (a+b..n).each do |i|
    ary = Array.new(a) { 2 } + Array.new(b) { 1 }
    combi = [a,b].any?(&:zero?) ? 1 : factorial(ary.size) / ary.tally.values.inject(1) { | a, n| a *= factorial(n) }
    ans += combi
    a -= 1
    b += 2
  end
  ans
end

def factorial(num)
  (1..num).inject(:*)
end

def climb_stairs_fibo(n)
  a, b = 1, 1
  n.times { a, b = b, a + b }
  a
end

puts climb_stairs(7)
puts climb_stairs_fibo(7)

puts climb_stairs(20)
puts climb_stairs_fibo(20)

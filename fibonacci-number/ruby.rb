def fib(n)
    @memo ||= { 0 => 0, 1 => 1 }
    @memo[n] ||= fib(n-1) + fib(n-2)
end

puts fib(10)
puts fib(5)
puts fib(2)
puts fib(0)

class MyStack
  def initialize() = @stack = []
  def push(x) = @stack << x
  def pop() = @stack.pop
  def top() = @stack[-1]
  def empty() = @stack.empty?
end

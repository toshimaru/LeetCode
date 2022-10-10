# @param {String[]} operations
# @return {Integer}
def cal_points(operations)
  stack = []
  while ope = operations.shift
    case ope
    when '+'
      stack << stack[-1] + stack[-2]
    when 'D'
      stack << stack[-1] * 2
    when 'C'
      stack.pop
    else
      stack << ope.to_i
    end
  end
  stack.sum
end

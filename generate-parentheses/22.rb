MAPPING = {
  1  => '(',
  -1 => ')',
}

# @param {Integer} n
# @return {String[]}
def _generate_parenthesis(n)
  result = []
  ary = Array.new(n*2-2) { [1, -1] } << [-1]
  [1].product(*ary).each do |_ary|
    sum = 0
    _ary.each do |num|
      sum += num
      break sum if sum < 0
    end
    result << _ary.map { |val| MAPPING[val] }.join if sum == 0
  end
  result
end

def generate_parenthesis(n)
  generate(n, 0, 0, '', [])
end

def generate(n, o, c, cur, res)
  res << cur if o + c == 2 * n
  generate(n, o + 1, c, cur + '(', res) if o < n
  generate(n, o, c + 1, cur + ')', res) if c < o
  res
end

def generate_parenthesis2(n)
  @res = []
  generate2(n, 0, 0, '')
  @res
end

def generate2(n, o, c, cur)
  @res << cur if o + c == 2 * n
  generate(n, o + 1, c, cur + '(') if o < n
  generate(n, o, c + 1, cur + ')') if c < o
end

p generate_parenthesis(3)

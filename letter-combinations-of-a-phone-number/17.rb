NUM2LETTERS = {
  '2' => ['a', 'b', 'c'], '3' => ['d', 'e', 'f'], '4' => ['g', 'h', 'i'],
  '5' => ['j', 'k', 'l'], '6' => ['m', 'n', 'o'], '7' => ['p', 'q', 'r', 's'],
  '8' => ['t', 'u', 'v'], '9' => ['w', 'x', 'y', 'z'],
}.freeze

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
    chars = digits.chars.map { |n| NUM2LETTERS[n] }
    chars.empty? ? [] : [''].product(*chars).map(&:join)
end

def _letter_combinations(digits)
    @result, @char_size = [], digits.length
    @chars = digits.chars.map { |n| NUM2LETTERS[n] }
    combination if @char_size > 0
    @result
end

def combination(char = '', index = 0)
  return @result << char if char.length == @char_size
  @chars[index].each { |c| combination(char + c, index + 1) }
end

p letter_combinations("23")
p _letter_combinations("23")
p letter_combinations("987")
p _letter_combinations("987")

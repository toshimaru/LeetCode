# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  digits.reverse_each.with_index(1) do |digit, i|
    if digit == 9
      digits[-i] = 0
      return digits.unshift(1) if digits[-(i+1)].nil?
    else
      digits[-i] = digit + 1
      return digits
    end
  end
end

def _plus_one(digits)
  (digits.join.to_i + 1).to_s.chars.map(&:to_i)
end

p plus_one([1,2,3])
p plus_one([8])
p plus_one([1,0])
p plus_one([1,9])
p plus_one([1,9,9])
p plus_one([9])
p plus_one([9,9])

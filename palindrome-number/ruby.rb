# @param {Integer} x
# @return {Boolean}
# def is_palindrome(x)
#   return false if x < 0
#   x = x.to_s
#   x == x.reverse
# end

def is_palindrome(x)
  return false if x < 0
  return false if x % 10 == 0 && x > 0

  revert_num = 0
  while x > revert_num
    revert_num = revert_num * 10 + x % 10
    x /= 10
  end

  x == revert_num || x == revert_num / 10
end

p is_palindrome(9)
p is_palindrome(77)
p is_palindrome(121)
p is_palindrome(-121)

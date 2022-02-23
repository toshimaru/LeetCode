# @param {String} s
# @return {String}
def longest_palindrome(s)
    return s if s.length == 1

    max = 1
    max_i = 0
    (s.length-1).times do |i|
        _max = [calc_max(s, i, i+1), calc_max(s, i-1, i+1)].max
        if _max > max
            max = _max
            max_i = i
        end
    end
    head = max_i - (max - 1) / 2
    tail = max_i + max / 2
    s[head..tail]
end

def calc_max(s, b, e)
    while s[b] == s[e] && b >= 0
        b -= 1
        e += 1
    end
    e - b - 1
end

s = "cbbd"
puts longest_palindrome(s)
s = "cbbbd"
puts longest_palindrome(s)
s = "cbbbbd"
puts longest_palindrome(s)
s = "babad"
puts longest_palindrome(s)
s = "bcabacdd"
puts longest_palindrome(s)
s = "ac"
puts longest_palindrome(s)
s = "acdx"
puts longest_palindrome(s)
s = "bb"
puts longest_palindrome(s)
s = "ccc"
puts longest_palindrome(s)
s = "a"
puts longest_palindrome(s)
s = "aaaa"
puts longest_palindrome(s)
s = "abaaba"
puts longest_palindrome(s)

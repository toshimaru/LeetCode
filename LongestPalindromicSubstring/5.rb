# @param {String} s
# @return {String}
def longest_palindrome(s)
    l = s.length
    return s if l == 1

    max = 1
    max_i = 0
    (l-1).times do |i|
        _max = [palindrome_length(s, i, i+1), palindrome_length(s, i-1, i+1)].max
        if _max > max
            max = _max
            max_i = i
            break if max == l # for perforamance
        end
    end
    head = max_i - (max - 1) / 2
    tail = max_i + max / 2
    s[head..tail]
end

def palindrome_length(s, l, r)
    while s[l] == s[r] && l >= 0
        l -= 1
        r += 1
    end
    r - l - 1
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

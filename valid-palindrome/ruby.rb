# @param {String} s
# @return {Boolean}
def is_palindrome1(s)
    str = s.downcase.chars.select { |s| s.match?(/[A-Za-z0-9]/) }
    str == str.reverse
end

def is_palindrome2(s)
    left, right = 0, s.size - 1

    while left < right
        lchar, rchar = s[left], s[right]
        left += 1 and next if !lchar.match?(/[A-Za-z0-9]/)
        right -= 1 and next if !rchar.match?(/[A-Za-z0-9]/)
        return false if lchar.downcase != rchar.downcase

        left += 1
        right -= 1
    end

    true
end

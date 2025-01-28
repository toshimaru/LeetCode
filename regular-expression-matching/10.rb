# See also.
# - https://www.youtube.com/watch?v=HAA8mgxlov8
# - https://www.youtube.com/watch?v=l3hda49XcDE&t=793s

# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
    @s, @p = s, p
    @m, @n = s.size, p.size
    @cache = Array.new(@m + 1) { [] }
    dfs(0, 0)
end

def dfs(i, j)
    return i == @m if j == @n
    return @cache[i][j] unless @cache[i][j].nil?

    match = i < @m && (@s[i] == @p[j] || @p[j] == '.')
    if j + 1 < @n && @p[j + 1] == '*'
        return @cache[i][j] = dfs(i, j + 2) || (match && dfs(i + 1, j))
    end

    return @cache[i][j] = dfs(i + 1, j + 1) if match

    @cache[i][j] = false
end

def is_match1(s, p)
  return s.empty? if p.empty?

  first = !s.empty? && [s[0], '.'].include?(p[0])
  if p[1] == '*'
    is_match(s, p[2..]) || (first && is_match(s[1..], p))
  else
    first && is_match(s[1..], p[1..])
  end
end

def is_match2(s, p)
  slen, plen = s.length, p.length
  dp = Array.new(slen + 1) { Array.new(plen + 1, false) }
  dp[slen][plen] = true
  slen.downto(0) do |i|
    (plen - 1).downto(0) do |j|
      first = i < slen && [s[i], '.'].include?(p[j])
      if p[j + 1] == '*'
        dp[i][j] = dp[i][j + 2] || (first && dp[i + 1][j])
      else
        dp[i][j] = first && dp[i + 1][j + 1]
      end
    end
  end
  dp[0][0]
end


=begin
puts is_match("aa", "a")
puts is_match("a", ".")
puts is_match("aa", "a*")
puts is_match("ab", "a*")
puts is_match("aaaaaaaac", "a*c")
puts is_match("ab", ".*")

puts is_match2("ab", ".*")
puts is_match2("ab", "a*")
puts is_match2("aa", "a*")
puts is_match2("b", "a*b")
puts is_match2("by", "a*b.*y")
puts is_match2("*", "*")
puts is_match2("", "a*")
=end

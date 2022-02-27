# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
def is_bad_version(version)
  version >= 90
end

# @param {Integer} n
# @return {Integer}
def _first_bad_version(n)
  return 1 if n < 2

  last_bad_ver = n
  last_good_ver = 0
  n /= 2
  while n > 0
    if is_bad_version(n)
      return n if last_good_ver + 1 == n
      last_bad_ver = n
      n -= (n - last_good_ver) / 2
    else
      return n + 1 if last_bad_ver - 1 == n
      last_good_ver = n
      n += (last_bad_ver - n) / 2
    end
  end
end

# def first_bad_version(n)
#   (1..n).bsearch { |i| is_bad_version(i) }
# end

def first_bad_version(n)
  left, right = 1, n
  while left < right
    mid = left + (right-left) / 2
    if is_bad_version(mid)
        right = mid
    else
        left = mid + 1
    end
  end
  left
end

puts first_bad_version(100)

# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
    last_bad_ver, left, right = -1, 1, n
    while left <= right
        mid = (left + right) / 2
        if is_bad_version(mid)
            last_bad_ver = mid
            right = mid - 1
        else
            left = mid + 1
        end
    end
    last_bad_ver
end

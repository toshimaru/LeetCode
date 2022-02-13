MAX = 2 ** 31
INT_MAX = MAX - 1
INT_MIN = MAX * -1

def my_atoi(str)
    a = str.to_i
    return INT_MAX if a > INT_MAX
    return INT_MIN if a < INT_MIN
    a
end

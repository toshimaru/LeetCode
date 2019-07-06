func isPalindrome(x int) bool {
    if x < 0 || (x >= 10 && x % 10 == 0) {
        return false
    }
    sub := 0
    for ;x > sub; x /= 10 {
        sub = x % 10 + sub * 10
    }
    return x == sub || x == sub / 10
}

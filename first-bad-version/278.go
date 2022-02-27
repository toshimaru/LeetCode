package main

import "fmt"

func main() {
	fmt.Println(firstBadVersion(5))
}

func firstBadVersion(n int) int {
	left := 0
	right := n
	for left < right {
		mid := (left + right) / 2
		if isBadVersion(mid) {
			right = mid
		} else {
			left = mid + 1
		}
	}
	return left
}

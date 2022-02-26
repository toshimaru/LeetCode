package main

import "fmt"

func main() {
	a := maxSubArray([]int{-1, 2, 3, -10, 100, 10})
	fmt.Println(a)
}

func maxSubArray(nums []int) int {
	max := nums[0]
	sum := nums[0]
	for i, num := range nums {
		if i == 0 {
			continue
		}
		s := num + sum
		if s > num {
			sum = s
		} else {
			sum = num
		}
		if sum > max {
			max = sum
		}
	}
	return max
}

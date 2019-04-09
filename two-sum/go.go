package main

import "fmt"

func twoSum(nums []int, target int) []int {
	m := map[int]int{}
	for i, n := range nums {
		_, prs := m[n]
		if prs {
			return []int{m[n], i}
		} else {
			m[target-n] = i
		}
	}
	return nil
}

func main() {
	fmt.Println(twoSum([]int{11, 15, 2, 7}, 9))
}

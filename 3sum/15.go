package main

import "fmt"
import "sort"

func threeSum(nums []int) [][]int {
	var answer [][]int
	sort.Ints(nums)
	len := len(nums)
	for i := 0; i < len-2; i++ {
		if i > 0 && nums[i] == nums[i-1] {
			continue
		}
		left, right, expected := i+1, len-1, -nums[i]
		for left < right {
			if left > i+1 && nums[left] == nums[left-1] {
				left++
				continue
			}
			if right < len-1 && nums[right] == nums[right+1] {
				right--
				continue
			}
			sum := nums[left] + nums[right]
			if sum == expected {
				answer = append(answer, []int{nums[i], nums[left], nums[right]})
				left++
				right--
			} else if sum > expected {
				right--
			} else {
				left++
			}
		}
	}
	return answer
}

func main() {
	fmt.Println(threeSum([]int{-1, 0, 1, 2, -1, -4}))
	fmt.Println(threeSum([]int{1, -1, -1, 0}))
	fmt.Println(threeSum([]int{-2, 0, 0, 2, 2}))
}

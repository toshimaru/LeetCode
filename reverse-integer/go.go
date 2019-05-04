package main

import (
	"fmt"
	"math"
)

func reverse(x int) (result int) {
	for x != 0 {
		result = result*10 + x%10
		if result > math.MaxInt32 || result < math.MinInt32 {
			return 0
		}
		x = x / 10
	}
	return
}

func main() {
	fmt.Println(reverse(12345))
}

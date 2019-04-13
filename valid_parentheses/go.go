package main

import (
	"fmt"
)

func isValid(s string) bool {
	var stack []rune
	m := map[rune]rune{'{': '}', '(': ')', '[': ']'}

	for _, c := range s {
		switch c {
		case '{', '[', '(':
			stack = append(stack, c)
		case '}', ']', ')':
			if len(stack) == 0 {
				return false
			}
			if m[stack[len(stack)-1]] == c {
				stack = stack[:len(stack)-1]
			} else {
				return false
			}
		}
	}
	return len(stack) == 0
}

func main() {
	fmt.Println(isValid(""))
	fmt.Println(isValid("{}"))
	fmt.Println(isValid("{]"))
	fmt.Println(isValid("{}()"))
	fmt.Println(isValid("[()](())"))
	fmt.Println(isValid("[(({})}]"))
}

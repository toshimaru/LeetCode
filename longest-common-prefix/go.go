package main

import "fmt"

func longestCommonPrefix(strs []string) string {
	if len(strs) == 0 {
		return ""
	}
	w := strs[0]
	strs = strs[1:]
	a := 0

LOOP:
	for a < len(w) {
		for _, str := range strs {
			if a >= len(str) {
				break LOOP
			}
			if w[a] != str[a] {
				break LOOP
			}
		}
		a++
	}

	return w[0:a]
}

func main() {
	fmt.Println(longestCommonPrefix([]string{"abc", "def"}))
	fmt.Println(longestCommonPrefix([]string{"abc", "aef"}))
	fmt.Println(longestCommonPrefix([]string{"abcd", "abcdefg"}))
}

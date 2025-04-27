func romanToInt(s string) int {
	m := map[rune]int{'M': 1000, 'D': 500, 'C': 100, 'L': 50, 'X': 10, 'V': 5, 'I': 1}
	result := 0
	n := len(s)
	runes := []rune(s)
	for i := 0; i < n; i++ {
		current_char_value := m[runes[i]]
		if i+1 < n {
			next_char_value := m[runes[i+1]]
			if current_char_value < next_char_value {
				result += next_char_value - current_char_value
				i++
			} else {
				result += current_char_value
			}
		} else {
			result += current_char_value
		}
	}
	return result
}

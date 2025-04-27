class Solution:
    def romanToInt(self, s: str) -> int:
        m = {"M": 1000, "D": 500, "C": 100, "L": 50, "X": 10, "V": 5, "I": 1}
        result = 0
        n = len(s)
        i = 0
        while i < n:
            current_char_value = m[s[i]]
            if i + 1 < n:
                next_char_value = m[s[i + 1]]
                if current_char_value < next_char_value:
                    result += next_char_value - current_char_value
                    i += 2
                else:
                    result += current_char_value
                    i += 1
            else:
                result += current_char_value
                i += 1
        return result

class Solution:
    def myAtoi(self, s: str) -> int:
        sign = 1
        result = 0
        i = 0
        while i < len(s) and s[i] == " ":
            i += 1
        if i < len(s) and s[i] == "+":
            i += 1
        elif i < len(s) and s[i] == "-":
            i += 1
            sign = -1
        while i < len(s) and s[i].isdigit():
            # signed 32-bit integer range is [-2^31, 2^31 - 1]
            # int max = 2^31 - 1 = 2147483647
            # int min = -2^31 = -2147483648
            result = result * 10 + int(s[i])
            i += 1
        result = sign * result
        int_max = 2**31 - 1
        int_min = -(2**31)
        if result > int_max:
            return int_max
        elif result < int_min:
            return int_min
        else:
            return result

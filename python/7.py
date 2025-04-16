class Solution:
    def reverse(self, x: int) -> int:
        # signed 32-bit integer range is [-2^31, 2^31 - 1]
        # int max = 2^31 - 1 = 2147483647
        # int min = -2^31 = -2147483648
        sign = -1 if x < 0 else 1
        x = abs(x)
        result = 0
        while x > 0:
            x, digit = divmod(x, 10)
            result = result * 10 + digit
            if result > 2**31 - 1:
                return 0
        return sign * result

        

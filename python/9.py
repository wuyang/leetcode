class Solution:
    def isPalindrome(self, x: int) -> bool:
        if x < 0:
            return False;
        t = x # temp variable to keep x unchanged
        r = 0 # reversed x
        while t > 0:
            r = r * 10 + t % 10
            t //= 10
        return x == r

        

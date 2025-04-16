class Solution:
    def expandFromCenter(self, s:str, left:int, right:int) -> int:
        while left >= 0 and right < len(s) and s[left] == s[right]:
            left += -1
            right += 1
        # [left + 1, right - 1] is the longest palindrome
        return right - 1 - (left + 1) + 1

    def longestPalindrome(self, s: str) -> str:
        start = 0  # start index of the longest palindrome so far
        length = 0 # length of the longest palindrome so far
        for i in range(len(s)):
            # expand odd palindrome like aba from center i
            oddLength = self.expandFromCenter(s, i, i)
            # expand even palindrome like abba from center i and i+1
            evenLength = self.expandFromCenter(s, i, i + 1)
            maxLength = max(oddLength, evenLength)
            if maxLength > length:
                length = maxLength
                start = i - (maxLength - 1) // 2
        return s[start:start + length]

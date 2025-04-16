class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        char_index_map = {}  # value -> last seen index
        max_length = 0
        left = -1 # left is the index of the elment before the substring (exclusive)
        for right, current_char in enumerate(s) :
            if current_char in char_index_map :
                left = max(char_index_map[current_char], left)
            char_index_map[current_char] = right
            max_length = max(max_length, right - left)
        return max_length

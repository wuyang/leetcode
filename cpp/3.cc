class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        unordered_map<char, int> char_index_map;  // value -> last see index
        int max_length = 0, left = -1; // left is the index of the elment before the substring (exclusive)
        for (int right = 0; right < s.size(); right++) {
            char current_char = s[right];
            if (char_index_map.find(current_char) != char_index_map.end()) {
                left = max(char_index_map[current_char], left);
            }
            char_index_map[current_char] = right;
            max_length = max(max_length, right - left);
        }
        return max_length;
    }
};

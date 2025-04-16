class Solution {
  int lengthOfLongestSubstring(String s) {
    Map<String, int> charIndexMap = {};
    int left = -1;  // the index before the left window
    int maxLength = 0;
    for (int right = 0; right < s.length; right++) {
        String char = s[right];
        if (charIndexMap.containsKey(char) && charIndexMap[char]! > left) {
            left = charIndexMap[char]!;
        }
        charIndexMap[char] = right;
        maxLength = max((right - left), maxLength);
    }
    return maxLength;
  }
}
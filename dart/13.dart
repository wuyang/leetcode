class Solution {
  int romanToInt(String s) {
    Map<String, int> m = {'M': 1000, 'D': 500, 'C': 100, 'L': 50, 'X': 10, 'V': 5, 'I': 1};
        int result = 0;
        int n = s.length;
        for (int i = 0; i < n; i++) {
            int currentCharValue = m[s[i]]!;
            if (i + 1 < n) {
                int nextCharValue = m[s[i + 1]]!;
                if (currentCharValue < nextCharValue) {
                    result += nextCharValue - currentCharValue;
                    i++;
                } else {
                    result += currentCharValue;
                }
            } else {
                result += currentCharValue;
            }
        }
        return result;
  }
}

class Solution {
public:
    int romanToInt(string s) {
        unordered_map<char, int> m = {{'M', 1000}, {'D', 500}, {'C', 100},
                                      {'L', 50},   {'X', 10},  {'V', 5},
                                      {'I', 1}};
        int result = 0;
        int n = s.length();
        for (int i = 0; i < n; i++) {
            int current_char_value = m[s[i]];
            if (i + 1 < n) {
                int next_char_value = m[s[i + 1]];
                if (current_char_value < next_char_value) {
                    result += next_char_value - current_char_value;
                    i++;
                } else {
                    result += current_char_value;
                }
            } else {
                result += current_char_value;
            }
        }
        return result;
    }
};

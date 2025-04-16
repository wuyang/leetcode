class Solution {
public:
    int myAtoi(string s) {
        int sign = 1;
        int result = 0;
        int i = 0;
        int len = s.size();
        while (i < len && s[i] == ' ') {
            i++;
        }
        if (i < len && s[i] == '+') {
            i++;
        } else if (i < len && s[i] == '-') {
            i++;
            sign = -1;
        }
        for (; i < len; i++) {
            char c = s[i];
            if (isdigit(c)) {
                int digit = c - '0';
                // Use int64_t will be easier. If not allowed, check the
                // range before multiplication.
                // signed 32-bit integer range is [-2^31, 2^31 - 1]
                // std::numeric_limits<int>::max() = 2,147,483,647
                // std::numeric_limits<int>::min() = -2,147,483,648
                int full_result = sign * result;
                if (full_result > std::numeric_limits<int>::max() / 10 ||
                    full_result == std::numeric_limits<int>::max() / 10 &&
                        digit >= 7) {
                    return std::numeric_limits<int>::max();
                } else if (full_result < std::numeric_limits<int>::min() / 10 ||
                           full_result ==
                                   std::numeric_limits<int>::min() / 10 &&
                               digit >= 8) {
                    return std::numeric_limits<int>::min();
                }
                result = result * 10 + digit;
            } else {
                break;
            }
        }
        return sign * result;
    }
};

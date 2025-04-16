class Solution {
public:
    int reverse(int x) {
        // signed 32-bit integer range is [-2^31, 2^31 - 1]
        // std::numeric_limits<int>::max() = 2,147,483,647
        // std::numeric_limits<int>::min() = -2,147,483,648
        int result = 0;
        while (x != 0) {
            int digit = x % 10;
            x /= 10;
            if ((result > std::numeric_limits<int>::max() / 10 ||
                 (result == std::numeric_limits<int>::max() / 10 &&
                  digit > 7)) ||
                (result < std::numeric_limits<int>::min() / 10 ||
                 (result == std::numeric_limits<int>::min() / 10 &&
                  digit < -8))) {
                return 0;
            }
            result = result * 10 + digit;
        }
        return result;
    }
};

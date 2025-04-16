class Solution {
  int myAtoi(String s) {
    int sign = 1;
    int result = 0;
    int i = 0;
    int len = s.length;
    const int INT_MAX = 2147483647;
    const int INT_MIN = -2147483648;
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
      int c = s.codeUnitAt(i);
      if (c >= '0'.codeUnitAt(0) && c <= '9'.codeUnitAt(0)) {
        int digit = c - '0'.codeUnitAt(0);
        // Use int64_t will be easier. If not allowed, check the
        // range before multiplication.
        // signed 32-bit integer range is [-2^31, 2^31 - 1]
        // int max = 2,147,483,647
        // int min = -2,147,483,648
        if (result > (INT_MAX - digit) ~/ 10) {
          return sign > 0 ? INT_MAX : INT_MIN;
        }
        result = result * 10 + digit;
      } else {
        break;
      }
    }
    return sign * result;
  }
}

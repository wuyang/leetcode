class Solution {
  int reverse(int x) {
    // signed 32-bit integer range is [-2^31, 2^31 - 1]
    // int max = 2,147,483,647
    // int min = -2,147,483,648
    int result = 0;
    int sign = (x < 0) ? -1 : 1;
    x = x.abs();

    while (x > 0) {
      int digit = x % 10;
      x = x ~/ 10;
      result = result * 10 + digit;
      //print(result);
      if (result > 2147483647) {
        return 0;
      }
    }

    return sign * result;
  }
}

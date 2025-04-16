class Solution {
  bool isMatch(String s, String p) {
    if (p.isEmpty) {
            return s.isEmpty;
        } else if (p.length >= 2 && p[1] == '*') { // process *
            if (s.isEmpty) {
                // drop ".*" or "a*" in p
                return isMatch(s, p.substring(2));
            } else if (s[0] == p[0] || p[0] == '.') {
                // match none and drop "a*" or ".*" in p
                return isMatch(s, p.substring(2)) ||
                       // match one char and keep "a*" or ".*" in p
                       isMatch(s.substring(1), p);
            } else {
                // no match char and drop "a*" in p
                return isMatch(s, p.substring(2));
            }
        } else if (!s.isEmpty && (s[0] == p[0] || p[0] == '.')) {
            // match one char without *
            return isMatch(s.substring(1), p.substring(1));
        } else {
            return false;
        }

  }
}

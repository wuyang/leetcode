class Solution {
public:
    bool isMatch(string s, string p) {
        if (p.empty()) {
            return s.empty();
        } else if (p.size() >= 2 && p[1] == '*') { // process *
            if (s.empty()) {
                // drop ".*" or "a*" in p
                return isMatch(s, p.substr(2));
            } else if (s[0] == p[0] || p[0] == '.') {
                // match none and drop "a*" or ".*" in p
                return isMatch(s, p.substr(2)) ||
                       // match one char and keep "a*" or ".*" in p
                       isMatch(s.substr(1), p);
            } else {
                // no match char and drop "a*" in p
                return isMatch(s, p.substr(2));
            }
        } else if (!s.empty() && (s[0] == p[0] || p[0] == '.')) {
            // match one char without *
            return isMatch(s.substr(1), p.substr(1));
        } else {
            return false;
        }
    }
};

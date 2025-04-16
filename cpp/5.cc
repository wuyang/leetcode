class Solution {
public:
    string longestPalindrome(string s) {
        int start = 0;  // start index of the longest palindrome so far
        int length = 0; // length of the longest palindrome so far
        for (int i = 0; i < s.size(); i++) {
            // expand odd palindrome like aba from center i
            expandFromCenter(s, i, i, &start, &length);
            // expand even palindrome like abba from center i and i+1
            expandFromCenter(s, i, i + 1, &start, &length);
        }
        return s.substr(start, length);
    }

private:
    void expandFromCenter(const string& s, int i, int j, int* start,
                          int* length) {
        int left = i, right = j;
        while (left >= 0 && right < s.size() && s[left] == s[right]) {
            left--;
            right++;
        }
        // [left + 1, right - 1] is the longest palindrome
        if (right - 1 - (left + 1) + 1 > *length) {
            *length = right - 1 - (left + 1) + 1;
            *start = left + 1;
        }
    }
};

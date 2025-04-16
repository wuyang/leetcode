class Solution {
public:
    string convert(string s, int numRows) {
        if (numRows <= 1 || s.length() < numRows)
            return s;
        /*
              0 1 2
              - - -
        row 0|
            1|
            2|
        */
        vector<string> rows(numRows);
        int row = 0, step = 1; // +1 is up, and -1 is down
        for (char c : s) {
            rows[row] += c;
            if (row + step >= numRows || row + step < 0) {
                step *= -1;
            }
            row += step;
        }
        string result;
        for (string r : rows) {
            result.append(r);
        }
        return result;
    }
};

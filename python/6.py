class Solution:
    def convert(self, s: str, numRows: int) -> str:
        if numRows <= 1 or len(s) < numRows:
            return s
        """
              0 1 2
              - - -
        row 0|
            1|
            2|
        """
        rows = [""] * numRows
        row = 0
        step = 1  # +1 is up, and -1 is down
        for c in s:
            rows[row] += c
            if row + step >= numRows or row + step < 0:
                step *= -1
            row += step
        return "".join(rows)

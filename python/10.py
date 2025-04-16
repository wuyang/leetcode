class Solution:
    def isMatch(self, s: str, p: str) -> bool:
        if len(p) == 0:
            return len(s) == 0
        elif len(p) >= 2 and p[1] == '*': # process *
            if len(s) == 0:
                # drop ".*" or "a*" in p
                return self.isMatch(s, p[2:])
            elif s[0] == p[0] or p[0] == '.':
                # match none and drop "a*" or ".*" in p
                # match one char and keep "a*" or ".*" in p
                return self.isMatch(s, p[2:]) or self.isMatch(s[1:], p)
            else:
                # no match char and drop "a*" in p
                return self.isMatch(s, p[2:])
        elif len(s) > 0 and (s[0] == p[0] or p[0] == '.'):
            # match one char without *
            return self.isMatch(s[1:], p[1:])
        else:
            return False

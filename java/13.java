class Solution {
    public int romanToInt(String s) {
        Map<Character, Integer> m = new HashMap<>();
        m.put('M', 1000);
        m.put('D', 500);
        m.put('C', 100);
        m.put('L', 50);
        m.put('X', 10);
        m.put('V', 5);
        m.put('I', 1);
        int result = 0;
        int n = s.length();
        for (int i = 0; i < n; i++) {
            int currentCharValue = m.get(s.charAt(i));
            if (i + 1 < n) {
                int nextCharValue = m.get(s.charAt(i + 1));
                if (currentCharValue < nextCharValue) {
                    result += nextCharValue - currentCharValue;
                    i++;
                } else {
                    result += currentCharValue;
                }
            } else {
                result += currentCharValue;
            }
        }
        return result;

    }
}

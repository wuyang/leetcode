class Solution {
  String convert(String s, int numRows) {
    if (numRows <= 1 || s.length < numRows) {
	  return s;
	}
	/*
	         0 1 2
	         - - -
	   row 0|
	       1|
	       2|
	*/
	List<StringBuffer> rows = List.generate(numRows, (_) => StringBuffer());
	int row = 0;
	int step = 1; // +1 is up, and -1 is down
	for (int i = 0; i < s.length; i++) {
	  rows[row].write(s[i]);
	  if (row+step >= numRows || row+step < 0) {
	    step *= -1;
	  }
	  row += step;
	}
	return rows.map((row)=>row.toString()).join("");
  }
}

class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
        int n1 = nums1.length;
        int n2 = nums2.length;
        // n1 needs to be smaller than n2
        // otherwise p2 could be out of nums2 in edage cases.
        if (n1 > n2) {
            return findMedianSortedArrays(nums2, nums1);
        }

        int left = 0;
        // If use n1 - 1, the round of -1/2 will be hard to handle 
        int right = n1;
        while (left <= right) {
            // p1 is both the index of first right side element in nums1
            // and nums1's left side element count.
            // p2 is both the index of first right side element in nums2
            // and nums2's left side element count.
            // So, p1 + p2 = (n1 + n2 + 1 ) / 2 = total left side element count.
            // If use the index of last left side element, the edge cases will
            // much more complicated. 
            int p1 = (left + right) ~/ 2; 
            int p2 = (n1 + n2 + 1 ) ~/ 2  - p1; 
            // Value of the last left side element in nums1 
            double left_max_1 = p1 -1 < 0 ? double.negativeInfinity: nums1[p1 - 1].toDouble();
            // Value of the first right side element in nums1 
            double right_min_1 = p1 >= n1 ? double.infinity : nums1[p1].toDouble();
            // Value of the last left side element in nums2 
            double left_max_2 = p2 - 1 < 0 ? double.negativeInfinity: nums2[p2 - 1].toDouble();
            // Value of the first right side element in nums2 
            double right_min_2 = p2 >= n2 ? double.infinity: nums2[p2].toDouble();
            if (left_max_1 > right_min_2) {
                right = p1 - 1;
            } else if (left_max_2 > right_min_1) {
                left = p1 + 1;
            } else {
                if ((n1 + n2) % 2 == 1) { // odd
                    return max(left_max_1, left_max_2);
                } else { // even
                    return (max(left_max_1, left_max_2) + min(right_min_1, right_min_2)) / 2.0;
                }
            }
        }
        return 0.0; // Not possible
  }
}
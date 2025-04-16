class Solution {
  int maxArea(List<int> height) {
    int maxArea = 0, left = 0, right = height.length - 1;
    while (right > left) {
        maxArea = max(maxArea,
                      (right - left) * min(height[left], height[right]));
        if (height[left] > height[right]) {
            right--;
        } else {
            left++;
        }
    }
    return maxArea;
  }
}

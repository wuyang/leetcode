class Solution {
  List<int> twoSum(List<int> nums, int target) {
    Map<int, int> valueIndexMap = {};
    for (int i  = 0; i < nums.length; i++) {
        int complement = target - nums[i];
        if (valueIndexMap.containsKey(complement)) {
            return [valueIndexMap[complement]!, i];
        }
        valueIndexMap[nums[i]] = i;
    }
    return [];
  }
}
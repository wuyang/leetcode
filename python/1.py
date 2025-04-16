class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        m = {}
        for i, v in enumerate(nums):
            compliment = target - v;
            if compliment in m:
                return [m[compliment], i]
            m[v] = i
        return [] 
        

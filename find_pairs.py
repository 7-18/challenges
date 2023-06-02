# cat DATA.lst | python find_pairs.py
from typing import List


def find_pairs(nums: List[int], target: int) -> List[str]:
    list_pairs = []
    len_nums = len(nums)
    for i in range(len_nums):
        for j in range(i + 1, len_nums):
            if nums[i] + nums[j] == target:
                list_pairs.append(f"{nums[i]}, {nums[j]}")
    return list_pairs


def main() -> None:
    test_data = input().split()
    list_numbers = [int(num) for num in test_data]
    target = int(input())
    list_pairs = find_pairs(list_numbers, target)
    for pair in list_pairs:
        print(pair)


if __name__ == "__main__":
    main()

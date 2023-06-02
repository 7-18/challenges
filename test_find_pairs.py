import unittest
from find_pairs import find_pairs


class TestFindPairs(unittest.TestCase):
    def test_find_pairs(self):
        nums = [1, 9, 5, 0, 20, -4, 12, 16, 7]
        target = 12
        expected_result = ['5, 7', '0, 12', '-4, 16']
        pairs = find_pairs(nums, target)
        output = [pair for pair in pairs]
        self.assertEqual(output, expected_result)


if __name__ == '__main__':
    unittest.main()

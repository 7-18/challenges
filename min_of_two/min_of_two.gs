[indent = 2]

def read_lines(num_cases: int, n: int,
test_cases: array of string): array of string
  if n == num_cases
    return test_cases
  test_cases[n] = stdin.read_line()
  return read_lines(num_cases, n + 1, test_cases)

def min_of_two(data: array of string, n: int,
res: array of string): array of string
  if n == data.length
    return res
  str_arr: array of string = data[n].split(" ")
  a: int = int.parse(str_arr[0])
  b: int = int.parse(str_arr[1])
  res[n] = find_min(a, b).to_string()
  return min_of_two(data, n + 1, res)

def find_min(a: int, b: int): int
  if a < b
    return a
  return b

init
  num_cases: int = int.parse(stdin.read_line())
  test_cases: array of string = new array of string[num_cases]
  data: array of string = read_lines(num_cases, 0, test_cases)
  res: array of string = min_of_two(data, 0, test_cases)
  print "%s", string.joinv(" ", res)

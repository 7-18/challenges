[indent = 2]

def read_lines(num_cases: int, n: int,
test_cases: array of string): array of string
  if n == num_cases
    return test_cases
  test_cases[n] = stdin.read_line()
  return read_lines(num_cases, n + 1, test_cases)

def least_common_multiple(a: int, b: int, gcd: int): int
  return a * b / gcd

def euclidean_greatest_common(a: int, b: int): int
  if b == 0
    return a
  else
    return euclidean_greatest_common(b, a % b)

def gcd_lcm (data: array of string, n: int,
res: array of string): array of string
  if n == data.length
    return res
  str_arr: array of string = data[n].split(" ")
  a: int = int.parse(str_arr[0])
  b: int = int.parse(str_arr[1])
  gcd: int = euclidean_greatest_common(a, b)
  lcm: int = least_common_multiple(a, b, gcd)
  res[n] = "(" + gcd.to_string() + " " + lcm.to_string() + ")"
  return gcd_lcm(data, n + 1, res)

init
  num_cases: int = int.parse(stdin.read_line())
  test_cases: array of string = new array of string[num_cases]
  data: array of string = read_lines(num_cases, 0, test_cases)
  res: array of string = gcd_lcm(data, 0, test_cases)
  print "%s", string.joinv (" ", res)

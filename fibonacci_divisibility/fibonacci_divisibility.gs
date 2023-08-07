[indent = 2]

def fibonacci_divisibility(num_cases: int, n: int,
data: array of string): array of string
  if n == num_cases
    return data
  data[n] = fib_div(int.parse(data[n]), 0, 1, 1).to_string()
  return fibonacci_divisibility(num_cases, n + 1, data)

def fib_div(m: int, a: int, b: int, index: int): int
  if b % m == 0
    return index
  return fib_div(m, b, (a + b) % m, index + 1)

init
  num_cases: int = int.parse(stdin.read_line())
  data: array of string = stdin.read_line().split(" ")
  res: array of string = fibonacci_divisibility(num_cases, 0, data)
  print "%s", string.joinv(" ", res)

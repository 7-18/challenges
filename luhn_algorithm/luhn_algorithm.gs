[indent = 2]

def read_lines(num_cases: int, n: int,
test_cases: array of string): array of string
  if n == num_cases
    return test_cases
  test_cases[n] = stdin.read_line()
  return read_lines(num_cases, n + 1, test_cases)

def luhn_algorithm(data: array of string, n: int,
res: array of string): array of string
  if n == data.length
    return res
  card_num: string = data[n]
  res[n] = find_error(card_num, 0).to_string()
  return luhn_algorithm(data, n + 1, res)

def checksum(card_num: string, n: int, sums: int): int
  digit: int = int.parse(card_num[n].to_string())
  if n % 2 == 0
    if digit * 2 > 9
      sums += (digit * 2) - 9
    else
      sums += digit * 2
  else
    sums += digit
  if n == card_num.length - 1
    return sums
  return checksum(card_num, n + 1, sums)

def valid_card_number(checksum: int): bool
  return checksum % 10 == 0

def find_error(card_num: string, n: int): uint64
  if "?" in card_num
    digit: string = card_num.replace("?", n.to_string())
    sums: int = checksum(digit, 0, 0)
    if valid_card_number(sums)
      return uint64.parse(digit)
    else
      return find_error(card_num, n + 1)
  else
    swap_error_lhs: string = card_num.slice(0, n)
    next_num: string = card_num[n + 1].to_string()
    actual_num: string = card_num[n].to_string()
    swap_error_rhs: string = card_num.substring(n + 2)
    digit: string = swap_error_lhs + next_num + actual_num + swap_error_rhs
    sums: int = checksum(digit, 0, 0)
    if valid_card_number(sums)
      return uint64.parse(digit)
    else
      return find_error(card_num, n + 1)

init
  num_cases: int = int.parse(stdin.read_line())
  test_cases: array of string = new array of string[num_cases]
  data: array of string = read_lines(num_cases, 0, test_cases)
  res: array of string = luhn_algorithm(data, 0, test_cases)
  print "%s", string.joinv(" ", res)

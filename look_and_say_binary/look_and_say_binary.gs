[indent = 2]

def get_sequences(input: string): double
  digits: int = input.replace("0", "").length
  return Math.pow(2, digits - 1)

def int_to_bit(n: int): int
  if n is 0
    return 0
  if n is 1
    return 1
  return (n % 2) + 10 * int_to_bit(n / 2)

def get_steps(data: string, steps: int): int
  if data is "10"
    return steps
  curr: array of string = new array of string[data.length]
  bit_aux: string = int_sequences(data, curr, 1, 0, 0)
  return get_steps(bit_aux, steps + 1)

def int_sequences(data: string, curr: array of string,
times: int, n: int, i: int): string
  acc: array of string = new array of string[curr.length]
  if n is data.length
    return binary_sequences(curr, acc, 0)
  if data[n] is data[n + 1]
    return int_sequences(data, curr, times + 1, n + 1, i)
  else
    curr[i] = times.to_string()
    times = 1
    return int_sequences(data, curr, times, n + 1, i + 1)

def binary_sequences(curr: array of string,
acc: array of string, n: int): string
  if n is curr.length or curr[n] is null
    return string.joinv("", acc)
  acc[n] = int_to_bit(int.parse(curr[n].to_string())).to_string()
  return binary_sequences(curr, acc, n + 1)

init
  input_data: string = stdin.read_line()
  sequences: double = get_sequences(input_data)
  steps: int = get_steps(input_data, 0)
  print "%d %.0f", steps, sequences

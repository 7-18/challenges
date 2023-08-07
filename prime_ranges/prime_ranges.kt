fun primeRanges(line: String) {
  val (a: Int, b: Int) = line.split(' ').map { it.toInt() }
  val count = 0
  isPrime(a, b, count)
  val lines: String? = readLine()
  if (lines != null) primeRanges(lines)
}

tailrec fun isPrime(a: Int, b: Int, count: Int) {
  var countPrime: Int = count
  val p: Boolean = isPrimeCheck(a)
  if (p) countPrime += 1
  return if (a < b) isPrime(a + 1, b, countPrime)
  else totalCount(countPrime)
}

tailrec fun isPrimeCheck(a: Int, n: Int = 3): Boolean {
  if (a % 2 == 0) return false
  if (a % n == 0) return false
  if (n * n > a) return true
  return isPrimeCheck(a, n + 2)
}

fun totalCount(countPrime: Int) = println(countPrime)

fun main() {
  readLine()!!
  val line: String = readLine()!!
  primeRanges(line)
}

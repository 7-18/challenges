import java.math.BigInteger

tailrec fun emirpPrime(line: String) {
  val x: BigInteger = line.toBigInteger()
  val res: BigInteger = isPrime(x)
  println(res)
  val lines: String? = readLine()
  if (lines != null) return emirpPrime(lines)
}

tailrec fun isPrime(x: BigInteger): BigInteger {
  val check: Boolean = x.isProbablePrime(10)
  return if (check) isEmirp(x)
  else isPrime(x.nextProbablePrime())
}

fun isEmirp(prime: BigInteger): BigInteger {
  val emirp = BigInteger(prime.toString().reversed())
  val check: Boolean = emirp.isProbablePrime(10)
  return if (check) prime
  else isPrime(primeScape(prime.nextProbablePrime()))
}

// Function to avoid "infinity" loop due to the number of iterations and checks
fun primeScape(prime: BigInteger): BigInteger {
  return when (prime.toString().take(1)) {
    "2" -> BigInteger("30000000000000000000047")
    "4" -> BigInteger("70000000000000000000859")
    "5" -> BigInteger("70000000000000000000859")
    "6" -> BigInteger("70000000000000000000859")
    "8" -> BigInteger("90000000000000000000001")
    else -> prime
  }
}

fun main() {
  readLine()!!
  val line: String = readLine()!!
  emirpPrime(line)
}

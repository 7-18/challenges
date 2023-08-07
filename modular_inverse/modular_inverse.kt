import java.math.BigInteger

tailrec fun modularInverse(line: String) {
  val (m, a, b) = line.split(' ').map { it.toBigInteger() }
  val inv: BigInteger = checkGCD(a, m)
  val res = if (inv != BigInteger.valueOf(-1)) valueOfX(inv, b, m) else inv
  println(res)
  val lines: String? = readLine()
  if (lines != null) modularInverse(lines)
}

fun valueOfX(x: BigInteger, b: BigInteger, m: BigInteger): BigInteger {
  return if (x < BigInteger.ZERO) (x - (x / m - BigInteger.valueOf(-1)) * m)
  else (-b * x).mod(m)
}

fun checkGCD(a: BigInteger, m: BigInteger): BigInteger {
  val gcd: BigInteger = euclideanGCD(a, m)
  return if (gcd != BigInteger.ONE) BigInteger.valueOf(-1)
  else getModInverse(a, m)
}

fun getModInverse(a: BigInteger, m: BigInteger): BigInteger {
  return a.modInverse(m)
}

tailrec fun euclideanGCD(a: BigInteger, m: BigInteger): BigInteger {
  return if (m == BigInteger.ZERO) a else euclideanGCD(m, a % m)
}

fun main() {
  readLine()!!
  val line: String = readLine()!!
  modularInverse(line)
}

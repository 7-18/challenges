import kotlin.math.ceil

fun twoPrinters(line: String) {
  val (x: Int, y: Int, n: Int) = line.split(' ').map { it.toInt() }
  println(printer(x, y, n))
  val afterLine: String = readLine()!!
  twoPrinters(afterLine)
}

fun printer(x: Int, y: Int, n: Int): Int {
  val fPrinter: Double = ceil(x = (x / (x + y).toDouble()) * n) * y
  val sPrinter: Double = ceil(x = (y / (x + y).toDouble()) * n) * x
  return minOf(fPrinter, sPrinter).toInt()
}

fun main() {
  readLine()!!
  val firstLine: String = readLine()!!
  twoPrinters(firstLine)
}

fun squareRoot(line: String) {
  val (x: Int, N: Int) = line.split(' ').map { it.toInt() }
  val r = 1
  println(root(x, N, r.toDouble()))
  val afterLine: String = readLine()!!
  squareRoot(afterLine)
}

fun root(x: Int, N: Int, r: Double): Any {
  val rNew: Double = (r + x / r) / 2
  return if (N > 1) root(x, N - 1, rNew) else if (N == 0) r else rNew
}

fun main() {
  readLine()!!
  val firstLine: String = readLine()!!
  squareRoot(firstLine)
}

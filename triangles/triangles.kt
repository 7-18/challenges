fun triangles(line: String) {
  val lines: List<Int> = line.split(' ').map { it.toInt() }
  val (A: Int, B: Int, C: Int) = lines
  val lineMin: Int = minOf(A, B, C)
  val lineMax: Int = maxOf(A, B, C)
  val lineMid: Int = lines.find { it != lineMin && it != lineMax }!!.toInt()
  if (lineMin + lineMid > lineMax) println(1) else println(0)
  val afterLine: String = readLine()!!
  triangles(afterLine)
}

fun main() {
  readLine()!!
  val firstLine: String = readLine()!!
  triangles(firstLine)
}

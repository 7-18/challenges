fun readNextLines(line: String) {
  val list: MutableList<Int> = mutableListOf()
  val splitLine: List<String> = line.split(' ')
  list.add(splitLine[0].toInt() + splitLine[1].toInt())
  println(list.joinToString { "$it" })
  val afterLine: String? = readLine()
  if (afterLine != null) readNextLines(afterLine)
}

fun main() {
  readLine()!!
  val afterLine: String = readLine()!!
  readNextLines(afterLine)
}

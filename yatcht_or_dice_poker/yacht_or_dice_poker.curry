import IO
import Read
import List

getInput :: IO String
getInput = do
  values <- getContents
  return values

parseInt :: String -> Int
parseInt s = read s :: Int

sort :: Prelude.Ord a => [a] -> [a]
sort [] = []
sort (x : xs) = insert x (sort xs)

insert :: Prelude.Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y : ys)
  | x <= y = x : y : ys
  | otherwise = y : insert x ys

getCombinations :: [Int] -> Int -> Int -> Int -> Int -> Int -> String
getCombinations dataList a b c d e = combinations
  where
    combinations
      | (a == e) = "yacht"
      | ((a == b && c == e) ||
        (a == c && d == e)) &&
        (a /= e) = "full-house"
      | (a == d) || (b == e) = "four"
      | (a == c) || (b == d) || (c == e) = "three"
      | dataList == [1, 2, 3, 4, 5] = "small-straight"
      | dataList == [2, 3, 4, 5, 6] = "big-straight"
      | a == b = show a
      | b == c = show b
      | c == d = show c
      | d == e = show d
      | otherwise = "none"

dicePlayGame :: [Int] -> String
dicePlayGame dataList = verifyCombinations
  where
    a = dataList !! 0
    b = dataList !! 1
    c = dataList !! 2
    d = dataList !! 3
    e = dataList !! 4
    combinations = getCombinations dataList a b c d e
    verifyCombinations
      | (length combinations) /= 1 = combinations
      | (a == b && (parseInt combinations) /= a) ||
        (b == c && (parseInt combinations) /= b) ||
        (c == d && (parseInt combinations) /= c) ||
        (d == e && (parseInt combinations) /= d) = "two-pairs"
      | otherwise = "pair"

yachtOrDice :: [String] -> [String] -> [String]
yachtOrDice dataCases res
  | (length dataCases) == 0 = res
  | otherwise =
    let
      dataList = sort (map (\x -> parseInt x) (split(==' ') (dataCases !! 0)))
      dice = dicePlayGame dataList
      new_res = res ++ [dice]
    in
      yachtOrDice (tail dataCases) new_res

main :: IO ()
main = do
  inputData <- getInput
  let
    dataCases = drop 1 (init (split (=='\n') inputData))
    res = yachtOrDice (dataCases) []
  putStrLn (unwords res)

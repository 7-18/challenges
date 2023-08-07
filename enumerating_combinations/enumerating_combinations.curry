import IO
import Read
import List
import Integer

fac :: Int -> Int -> Int
fac n k
  | (n < k) = 0
  | otherwise = factorial (n) `div` (factorial (k) * factorial (n - k))

seq :: Int -> Int -> Int -> Int
seq a b x
  | (fac a b) > x = seq (a - 1) b x
  | otherwise = a

enumerating :: Int -> Int -> Int -> Int -> Int -> [Int] -> [Int]
enumerating n k x a b acc
  | (k <= 0) = acc
  | otherwise =
    let
      curr = seq (a - 1) b x
      new_acc = acc ++ [n - 1 - curr]
    in enumerating n (k - 1) (x - fac curr b) curr (b - 1) new_acc

combinations :: [String] -> [Int] -> Int -> String -> String
combinations base enum curr acc
  | curr == (length enum) = acc
  | otherwise =
    let new_acc = acc ++ base !! (enum !! curr)
    in combinations base enum (curr + 1) new_acc

enumeratingCombinations :: [[Int]] -> [String] -> [String] -> [String]
enumeratingCombinations dataCases base res
  | (length dataCases) == 0 = res
  | otherwise =
    let
      dataList = head dataCases
      n = dataList !! 0
      k = dataList !! 1
      i = dataList !! 2
      enum = enumerating n k (fac n k - 1 - i) n k []
      comb = combinations base enum 0 ""
      new_res = res ++ [comb]
    in enumeratingCombinations (tail dataCases) base new_res

main :: IO ()
main = do
  input <- getContents
  let
    inputData = tail (map (\x -> words x)
      (init (split (=='\n') input)))
    dataCases = map (\t -> (map (\x -> readInt x) t)) inputData
    base =
      ["0","1","2","3","4","5","6","7","8","9",
        "A","B","C","D","E","F","G","H","I","J","K","L",
          "M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    res = enumeratingCombinations dataCases base []
  putStrLn (unwords res)

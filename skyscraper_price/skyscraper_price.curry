import IO
import Read
import List

getPrice :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int
getPrice n m new_m x i j price
  | j == n = price
  | otherwise = if (j == new_m)
      then
        let new_x = x + i
        in getPrice n m (new_m + m) new_x i (j + 1) (price + new_x)
      else getPrice n m new_m x i (j + 1) (price + x)

skyscraperPrice :: [[Int]] -> [Int] -> [String]
skyscraperPrice dataCases res
  | (length dataCases) == 0 = map (\x -> show x) res
  | otherwise =
    let
      dataList = head dataCases
      price = getPrice (dataList !! 0)
        (dataList !! 1) (dataList !! 1) (dataList !! 2) 1000 0 0
      new_res = res ++ [price]
    in
      skyscraperPrice (tail dataCases) new_res

main :: IO ()
main = do
  input <- getContents
  let
    inputData = tail (map (\x -> words x)
      (init (split (=='\n') input)))
    dataCases = map (\t -> (map (\x -> readInt x) t)) inputData
    res = skyscraperPrice dataCases []
  putStrLn (unwords res)

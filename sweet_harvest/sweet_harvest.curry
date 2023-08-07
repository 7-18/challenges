import IO
import Read
import List

getInput :: IO String
getInput = do
  values <- getContents
  return values

candiesGathered :: [Int] -> Int -> Int
candiesGathered isles n = candies
  where
    candies
      | (n >= length isles) = 0
      | otherwise =
        (isles !! n) + max (candiesGathered isles (n + 2))
        (candiesGathered isles (n + 3))

sweetHarvest :: [[Int]] -> [Int] -> [String]
sweetHarvest dataCases res
  | (length dataCases) == 0 = map (\x -> show x) res
  | otherwise =
    let
      getCandies = candiesGathered (head dataCases) 0
      new_res = res ++ [getCandies]
    in
      sweetHarvest (tail dataCases) new_res

main :: IO ()
main = do
  input <- getInput
  let cases = tail (map (\x -> words x) (init (split (=='\n') input)))
  dataCases <- mapM (\ch -> return (map (\x -> readInt x) ch)) cases
  let res = sweetHarvest dataCases []
  putStrLn (unwords res)

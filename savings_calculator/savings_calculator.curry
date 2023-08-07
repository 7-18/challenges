import IO
import Read
import List
import Float

getInput :: IO String
getInput = do
  values <- getContents
  return values

parseInt :: String -> Int
parseInt s = read s :: Int

parseFloat :: String -> Float
parseFloat s = read s :: Float

roundedDown :: Float -> Float -> Float
roundedDown s p = res
  where
    res = s +. (s *. p /. 100)

calculateYears :: Float -> Int -> Float -> Int -> Int
calculateYears s r p years
  | round (s) >= r = years
  | otherwise =
    let
      new_s = roundedDown s p
    in
      calculateYears new_s r p (years + 1)

savingsCalculator :: [String] -> [Int] -> [String]
savingsCalculator dataCases res
  | (length dataCases) == 0 = map (\x -> show x) res
  | otherwise =
    let
      dataList = split(==' ') (dataCases !! 0)
      s = parseFloat (dataList !! 0)
      r = parseInt (dataList !! 1)
      p = parseFloat (dataList !! 2)
      calc = calculateYears s r p 0
      new_res = res ++ [calc]
    in
      savingsCalculator (tail dataCases) new_res

main :: IO ()
main = do
  inputData <- getInput
  let
    dataCases = drop 1 (init (split (=='\n') inputData))
    res = savingsCalculator (dataCases) []
  putStrLn (unwords res)

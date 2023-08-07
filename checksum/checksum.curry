import IO
import Read
import List

getInput :: IO String
getInput = do
  values <- getContents
  return values

strToInt :: String -> Int
strToInt s = read s :: Int

checksum :: [String] -> Int -> Int -> Int -> Int
checksum numbs cases n res
  | n == cases = res
  | otherwise =
    let
      sum = res + strToInt (numbs !! n)
      multiply = sum * 113
      new_res = mod multiply 10000007
    in
      checksum numbs cases (n + 1) new_res

main :: IO ()
main = do
  inputData <- getInput
  let
    lines = split (=='\n') inputData
    numCases = strToInt (lines !! 0)
    dataCases = split (==' ') (drop 1 lines !! 0)
    res = show (checksum (dataCases) numCases 0 0)
  putStrLn (res)

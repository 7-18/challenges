import Read
import Prelude

fac :: Int -> Int
fac x
  | x == 0 = 1
  | otherwise = x * fac (x - 1)

countTickets :: Int -> Int -> Int -> Int -> Int -> Int
countTickets n b acc curr acc_max = count
  where
    ones = fac (acc - (acc_max * b))
    twos = fac (acc - (acc_max * b) + n - 1)
    threes = fac (n - acc_max) * fac acc_max
    fours
      | (acc_max `mod` 2) == 0 = 1
      | otherwise = -1
    digits
      | (ones * threes) == 0 = 0
      | otherwise =
        (twos * fours * n) `div` (ones * threes)
    count = curr + digits

getLuckyTickets :: Int -> Int -> Int -> Int -> Int
getLuckyTickets n b curr acc = tickets
  where
    acc_max = (acc `div` b)
    count = foldl (countTickets n b acc) 0 [0.. acc_max]
    tickets = curr + (count * count)

main :: IO ()
main = do
  input <- getLine
  let
    dataCases = map (\x -> readInt x) (words input)
    len = dataCases !! 0
    n = len `div` 2
    b = dataCases !! 1
    res = foldl (getLuckyTickets n b) 2 [1.. (n * (b - 1)) - 1]
  putStrLn (show res)

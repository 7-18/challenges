import Read
import Float
import List

calc :: [Int] -> String -> [Int]
calc curr op
  | op == "add" =
    take (length curr - 2) curr ++
      [curr !! (length curr - 2) + (last curr)]
  | op == "sub" =
    take (length curr - 2) curr ++
      [curr !! (length curr - 2) - (last curr)]
  | op == "mul" =
    take (length curr - 2) curr ++
      [curr !! (length curr - 2) * (last curr)]
  | op == "div" =
    take (length curr - 2) curr ++
      [curr !! (length curr - 2) `div` (last curr)]
  | op == "mod" =
    take (length curr - 2) curr ++
      [curr !! (length curr - 2) `mod` (last curr)]
  | otherwise =
    take (length curr - 1) curr ++
      [round (sqrt (i2f (last curr)))]

rpn :: [String] -> [Int] -> [Int]
rpn acc curr
  | (length acc) == 0 = curr
  | (head acc) == "add" = rpn (tail acc) (calc curr "add")
  | (head acc) == "sub" = rpn (tail acc) (calc curr "sub")
  | (head acc) == "mul" = rpn (tail acc) (calc curr "mul")
  | (head acc) == "div" = rpn (tail acc) (calc curr "div")
  | (head acc) == "mod" = rpn (tail acc) (calc curr "mod")
  | (head acc) == "sqrt" = rpn (tail acc) (calc curr "sqrt")
  | otherwise = rpn (tail acc) (curr ++ [readInt (head acc)])

main :: IO ()
main = do
  input <- getLine
  let res = rpn (words input) []
  putStrLn (unwords (map show res))

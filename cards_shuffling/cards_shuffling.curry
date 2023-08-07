import IO
import Read
import List

cards_shuffling :: [Int] -> [String] -> Int -> [String]
cards_shuffling index cards n
  | (length index) == 0 = cards
  | otherwise =
    let
      swap_left = replace (cards !! (head index)) n cards
      swap_right = replace (cards !! n) (head index) swap_left
    in cards_shuffling (tail index) swap_right (n + 1)

main :: IO ()
main = do
  input <- getContents
  let
    inputData = map (\x -> readInt x) (words input)
    index = map (\x -> mod x 52) inputData
    ranks = ["A", "2", "3", "4", "5", "6",
      "7", "8", "9", "T", "J", "Q", "K"]
    suits = ["C", "D", "H", "S"]
    cards = [s ++ r | s <- suits, r <- ranks]
    res = cards_shuffling index cards 0
  putStrLn (unwords res)

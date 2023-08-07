import IO
import List

decode :: [String] -> [Int] -> String -> String
decode alphabet indexes acc
  | (length indexes) == 0 = acc
  | otherwise =
    let
      curr = alphabet !! (head indexes)
      new_alphabet = [curr] ++ (delete curr alphabet)
      new_acc = acc ++ curr
    in decode new_alphabet (tail indexes) new_acc

main :: IO ()
main = do
  input <- getLine
  let
    characters = sequence (words input)
    alphabet = sequence ["abcdefghijklmnopqrstuvwxyz."]
    indexes = map (\x -> head (elemIndices x alphabet)) characters
    res = decode alphabet indexes ""
  putStrLn (res)

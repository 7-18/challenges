import IO
import List
import Float

parseFloat :: String -> Float
parseFloat s = read s :: Float

coordinates :: Float -> Float -> Float -> Float -> Float -> [Int]
coordinates x y h w height = coords
  where
    scrDist = 0.5
    scrWidth = 0.4
    scrHeight = 0.3
    eY = 1.0
    k = scrDist / x
    sX = -y * k
    sY = -eY * k
    sH = h * k
    rX = ((scrWidth / 2.0) + sX) * (w / scrWidth)
    rY1 = ((scrHeight / 2.0) - sY) * (height / scrHeight)
    rY2 = (height / scrHeight) * (((scrHeight / 2.0) - sY) - sH)
    coords = [round rX] ++ [round rY1] ++ [round rY2]

simpleScene :: [[Float]] -> [Int] -> [Int]
simpleScene dataCases res
  | (length dataCases) == 0 = res
  | otherwise =
    let
      dataList = head dataCases
      x = dataList !! 0
      y = dataList !! 1
      h = dataList !! 2
      coords = coordinates x y h 480.0 360.0
      new_res = res ++ coords
    in simpleScene (tail dataCases) new_res

main :: IO ()
main = do
  input <- getContents
  let
    inputData = tail (map (\x -> words x) (init (split (=='\n') input)))
    dataCases = map (\t -> (map (\x -> parseFloat x) t)) inputData
    res = simpleScene dataCases []
  putStrLn (unwords (map show res))

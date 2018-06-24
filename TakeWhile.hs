module Main where

maxPrefix x y = map fst (takeWhile checkTuple (zip x y))
    where
      checkTuple (a, b) = a == b


main :: IO ()
main = do
  let ans = sum (takeWhile (< 10000) (filter odd (map (^ 2) [1..])))
  print (ans)
  
  print (maxPrefix "ABCDEF" "ABCdef")

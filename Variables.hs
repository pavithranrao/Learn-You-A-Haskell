module Main where

cylinder r h =
  let
    sideArea = 2 * pi * r * h
    topArea = pi * r * r
    in sideArea + 2 * topArea

sum' xs = case xs of
  [] -> 0
  [x] -> x
  (x:y) -> x + sum' y

describeList xs = "The list is " ++ what xs
    where what [] = "empty."
          what [x] = "a singleton list."
          what xs = "a longer list."

main :: IO ()
main = do
  print (cylinder 10 20)
  let ans = [let square x = x * x in (square 5, square 3, square 2)]
  print (ans)

  print (sum' [1..5])

  print (describeList [1..5])

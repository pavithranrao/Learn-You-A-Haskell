module Main where

main :: IO ()

concatUs x y = x ++ y

append x y = x : y

getElementAtIndex x y = x !! y

main = do
  let l1 = [1,2,3,4]
  let l2 = [9,10,11,12]
  print (concatUs l1 l2)
  print (concatUs ['w','o'] ['o','t'])
  print (append 'A' " SMALL CAT")
  print (getElementAtIndex "Pavithran" 1)
  let b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
  print (getElementAtIndex b 1)
  -- head tail last init (all but last one)
  print (head [5,4,3,2,1])
  print (tail [5,4,3,2,1])
  print (last [5,4,3,2,1])
  print (init [5,4,3,2,1])
  print (length [5,4,3,2,1])
  print (null [1,2,3])
  print (null [])
  print (reverse [5,4,3,2,1])
  -- take example
  print (take 3 [5,4,3,2,1])
  print (take 1 [3,9,3])
  print (take 5 [1,2])
  print (take 0 [6,6,6])
  -- drop example
  print (drop 3 [8,4,2,1,5,6])
  print (drop 0 [1,2,3,4])
  print (drop 100 [1,2,3,4])
  -- min max
  print (minimum [8,4,2,1,5,6])
  print (maximum [1,9,2,3,4])
  -- sum and product
  print (sum [5,2,1,6,3,2,5,7])
  print (product [6,2,1,2])
  print (product [1,2,5,6,7,9,2,0])

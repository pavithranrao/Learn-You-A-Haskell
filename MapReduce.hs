module Main where

mapReduce  xs mapFn reduceFn         = foldl1 reduceFn         $ map mapFn xs
mapReduce' xs mapFn reduceFn initVal = foldl  reduceFn initVal $ map mapFn xs

mapFn x      = 2 * x
reduceFn x y = x + y  

main :: IO ()
main = do
  print (mapReduce [1..10] mapFn reduceFn)
  print (mapReduce [1..10] (* 2) (+))
  
  print (mapReduce' [1..10] mapFn reduceFn 100)
  print (mapReduce' [1..10] (* 2)   (+)    100)

module Main where

main :: IO ()
main = do
  let nums = [1..20]
  print (nums)
  let even = [2,4..20]
  print (even)
  -- cycle and repeat methods
  print (take 10 (cycle [1,2,3]))
  print (take 11 (cycle "LOL "))
  print (take 10 (repeat 1))
  print (take 10 (repeat [1, 2, 3]))

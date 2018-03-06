module Main where

main :: IO ()

doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

main = do
  print (doubleMe 4)
  print (doubleUs 4 5)

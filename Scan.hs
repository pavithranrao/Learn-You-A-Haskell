module Main where


{- scanl and scanr are like foldl and foldr, 
   only they report all the intermediate accumulator states in the form of a list.
   There are also scanl1 and scanr1, which are analogous to foldl1 and foldr1.
-}
main :: IO ()
main = do
  print (scanl (+) 1 [3,5,2,1])
  print (scanr (+) 1 [3,5,2,1])
  print (scanl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1])

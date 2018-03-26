module Main where
import Data.List

slice from to xs = take (to - from + 1) (drop from xs)

-- BinarySearch with list slicing
binarySearch xs target = binarySearchHelper (sort xs) target

-- helper fn in where
binarySearchHelper xs target
    | null xs   = False
    | ys == []  = y == target
    | otherwise = 
        let
          len = (length xs) - 1
          mid = len `div` 2
          in helper len mid (compare target (xs !! mid))
      where 
        (y:ys) = xs
        helper len mid compareOut
          | compareOut == GT = binarySearchHelper (slice (mid + 1) len xs) target
          | compareOut == LT = binarySearchHelper (slice 0 (mid - 1)   xs) target
          | compareOut == EQ = True
          
-- Traditional BinarySearch with low and high markers
binarySearch' xs target = binarySearchHelper' (sort xs) target 0 $ (length xs) - 1
          
-- Use of `case <exp> of <patterns>` 
binarySearchHelper' xs target low high
    | low >  high = False
    | low == high = xs !! low == target
    | otherwise   = 
        let
          mid = (high + low) `div` 2
        in 
          case (compare target (xs !! mid)) of
            GT -> binarySearchHelper' xs target (mid + 1) high
            LT -> binarySearchHelper' xs target low       (mid - 1)
            EQ -> True

-- binarySearchHelper xs target low high
--     | low >  high = False
--     | low == high = xs !! low == target
--     | otherwise =
--         let
--           mid = (high + low) `div` 2
--         in helper mid (compare target (xs !! mid))
--       where
--         helper mid compareOut
--           | compareOut == GT = binarySearchHelper xs target (mid + 1) high
--           | compareOut == LT = binarySearchHelper xs target low (mid - 1)
--           | compareOut == EQ = True            

main :: IO ()
main = do
  let xs = [1..10]
  print ("Method One")
  print (binarySearch xs 1)
  print (binarySearch xs 5)
  print (binarySearch xs 4)
  print (binarySearch xs 10)
  print (binarySearch xs 11)
  
  print (">>>")
  
  print ("Method Two")
  print (binarySearch' xs 1)
  print (binarySearch' xs 5)
  print (binarySearch' xs 4)
  print (binarySearch' xs 10)
  print (binarySearch' xs 11)

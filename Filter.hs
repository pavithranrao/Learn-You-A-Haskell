module Main where

-- Book implementation
-- filter :: (a -> Bool) -> [a] -> [a]
-- filter _ [] = []
-- filter p (x:xs)
--     | p x       = x : filter p xs
--     | otherwise = filter p xs

-- Custom `filter` implementation
filter' :: (a -> Bool) -> [a] -> [a]
filter' predicate xs
    | null xs         = []
    | predicate xHead = xHead : filter' predicate xTail
    | otherwise       = filter' predicate xTail
      where
        (xHead:xTail) = xs

-- Custom `filterNot` implementation
filterNot' :: (a -> Bool) -> [a] -> [a]
filterNot' predicate xs
    | null xs               = []
    | not (predicate xHead) = xHead : filterNot' predicate xTail
    | otherwise             = filterNot' predicate xTail
      where
        (xHead:xTail) = xs
        
largestDivisible :: (Integral a) => a  
largestDivisible = head (filter p [100000,99999..])  
    where p x = x `mod` 3829 == 0  

main :: IO ()
main = do
  print (filter' even [1..10])
  print (filterNot' even [1..10])
  
  print (filter' (>3) [1,5,3,2,1,6,4,3,2,1])
  print (filter' (==3) [1,2,3,4,5])
  let notNull x = not (null x) 
  print (filter' notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]])
  print (filter' (`elem` ['a'..'z']) "u LaUgH aT mE BeCaUsE I aM diFfeRent")
  print (filter' (`elem` ['A'..'Z']) "i lauGh At You BecAuse u r aLL the Same")

  print (largestDivisible)
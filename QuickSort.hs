module Main where

quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
-- using where clause
quickSort (x:xs) =
    smaller ++ [x] ++ greater
    where
      smaller = quickSort [a | a <- xs, a <= x]
      greater = quickSort [a | a <- xs, a > x]

-- quickSort (x:xs) =
--     let smaller = quickSort [a | a <- xs, a <= x]
--         greater = quickSort [a | a <- xs, a > x]
--     in  smaller ++ [x] ++ greater


main :: IO ()
main = do
    print (quickSort [9,4,1,5,2,8,6,3,7])

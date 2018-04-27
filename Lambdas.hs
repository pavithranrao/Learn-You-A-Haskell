module Main where

main :: IO ()
main = do
    -- decreasing range example
    let xs = zip [1..20] [20, 19..1]
    print (map (\(a, b) -> a + b) xs)
    
    let lst = [1..20]
    -- fiter numbers divisible by 3
    print (filter (\a -> a `mod` 3 == 0) lst)

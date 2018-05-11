module Main where

sum' xs = foldl (\acc present -> acc + present) 0 xs

-- Book Implementation
-- elem' xs x = foldl (\acc present -> if present == x then True else acc) False xs
-- Short circuit with acc value when True
elem' xs x = foldl (\acc present -> acc || present == x) False xs

-- reduce     => foldl1 foldr1 
-- fold(l/r)1 -> means the starting value is first (head) element in the list

sum'' xs = foldl1 (+) xs

-- Custom foldl1 Implementation
foldl1' fn (x:xs) = foldl fn x xs
foldr1' fn (x:xs) = foldr fn x xs
sum''' xs = foldl1' (+) xs

reverse' :: [a] -> [a]  
reverse' = foldl (\acc x -> x : acc) []

reverse'' :: [a] -> [a]  
reverse'' = foldr (\x acc -> acc ++ [x]) []

head'  = foldl1 (\x _ -> x)
tail'  = foldl1 (\_ x -> x)

head'' = foldr1 (\x _ -> x)
tail'' = foldr1 (\_ x -> x)

main :: IO ()
main = do
    let xs = [1..10]
    print (sum' xs)
    
    print (elem' "Pavi" 'a')
    print (elem' "Pavi" 'z')
    
    print (sum'' xs)
    print (sum''' xs)

    print (head' xs)
    print (tail' xs)
    
    print (head'' xs)
    print (tail'' xs)
    
    print (reverse' xs)
    print (reverse'' xs)

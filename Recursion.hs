module Main where


maximum' []  = error "Empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise   = maxTail
    where maxTail = maximum' xs

replicate' n x
    | n <= 0    = []
    | otherwise = appendList x (replicate' (n-1) x)
    where appendList y ys = y:ys

reverse' [] = []
reverse' (x:xs) = revAppendList (reverse' xs) x
    where revAppendList ys y = ys ++ [y]

zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = appendList (x, y) (zip' xs ys)
    where appendList z zs = z:zs

elem' target []     = False
elem' target [x]    = x == target
elem' target (x:xs) = elem' target xs || elem' target [x]

main :: IO ()
main = do
  print (maximum' [1..20])

  print (replicate' 5 3)

  print (reverse' [1..20])

  print (zip' [1..10] [11..20])

  print (elem' 5 [1..10])
  -- print (checkEqual 5 6)

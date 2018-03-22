module Main where


-- Book implementation
-- map :: (a -> b) -> [a] -> [b]
-- map _ [] = []
-- map f (x:xs) = f x : map f xs


-- Custom `map` implementation
map' :: (a -> b) -> [a] -> [b]
map' fn xs
    | null xs   = []
    | otherwise = fn xHead : map' fn xTail
      where
        (xHead:xTail) = xs

main :: IO ()
main = do
  print (map' (+ 1) [1..3])
  print (map' (++ "!") ["BIFF", "BANG", "POW"])
  print (map' (map' (^2)) [[1,2],[3,4,5,6],[7,8]])
  print (map' fst [(1,2),(3,5),(6,3),(2,6),(2,5)])

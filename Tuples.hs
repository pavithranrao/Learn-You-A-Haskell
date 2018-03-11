module Main where


main :: IO ()
main = do
  -- Tuples and Pairs in Haskell
  let tuple = (1, 2)
  print (tuple)

  -- fst and snd work only in Pairs!
  print (fst tuple)
  print (snd tuple)

  -- zip  functions
  print (zip [1..5] (take 5 (repeat 5)))
  print (zip [1 .. 5] ["one", "two", "three", "four", "five"])

  -- list comprehension to 3-Tuples
  let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]
  let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]
  print (zip [1..] ["apple", "orange", "cherry", "mango"])
  print (rightTriangles)

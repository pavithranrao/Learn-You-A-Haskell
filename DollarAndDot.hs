module Main where

oddSquareSum :: Integer
oddSquareSum = sum . takeWhile (< 10000) . filter odd . map (^ 2) $ [1..]

oddSquareSum' :: Integer  
oddSquareSum' =   
    let oddSquares = filter odd $ map (^2) [1..]  
        belowLimit = takeWhile (< 10000) oddSquares  
    in  sum belowLimit

main :: IO ()
main = do
    -- Function application with $
    print (sum (filter (> 10) (map (*2) [2..10])))
    -- equvalent to:
    print (sum $ filter (> 10) $ map (*2) [2..10])
    -- equvalent to:
    print $ sum $ filter (> 10) $ map (*2) [2..10]
  
    {-
     But apart from getting rid of parentheses, $ means that function application
     can be treated just like another function. That way, we can,
     for instance, map function application over a list of functions.
    -}

    -- Here list of functions become input over another function (applied function)
    print (map ($ 3) [(4+), (10*), (^2), sqrt])
    
    -- Function composition with .
    print $ map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24] 
    print $ map (negate . abs) [5,-3,-6,7,-3,2,-19,24] 
    -- Refer TakeWhile
    print $ oddSquareSum
    print (oddSquareSum')
    
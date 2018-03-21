module Main where

multThree :: (Num a) => a -> a -> a -> a 
multThree x y z = x * y * z

compareWithHundred :: (Num a, Ord a) => a -> Ordering  
compareWithHundred x = compare x 100

compareWithHundredCurry :: (Num a, Ord a) => a -> Ordering  
compareWithHundredCurry = compare 100

applyTwice :: (a -> a) -> a -> a  
applyTwice f x = f (f x)

multByTwo :: (Num a) => a -> a
multByTwo x = x * 2

applyNTimes f n x   
    | n == 1    = f x 
    | otherwise = f (applyNTimes f (n - 1) x)

-- zipWith' accepts a function as input and applies the function
-- on the elements of the two and zips them together
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]  
zipWith' _ [] _ = []  
zipWith' _ _ [] = []
-- 5 : [6] => [5,6]
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f x y = f y x

main :: IO ()
main = do
    -- prints 3 * 3 * 3
    print (multThree 3 3 3)
    let multTwoWithTen = multThree 10
    
    -- prints (2 * 3) * 10
    print (multTwoWithTen 2 3)
    
    print (compareWithHundred 10)
    print (compareWithHundredCurry 10)
    
    -- applyTwice performs f(x) twice 
    -- thus (2 * 2) * 1
    print (applyTwice multByTwo 1)
    
    -- Gets 2 ^ 5
    -- GP : a = 1, r = 2 , n = 5 => l = 32 (2 ^ 5)
    print (applyNTimes multByTwo 5 1)
    
    -- zipWith'
    let addFun = (+)
    print (zipWith' addFun [4,2,5,6] [2,6,2,3])
    print (zipWith' max [6,3,2,1] [7,3,1,5])
    print (zipWith' (++) ["foo ", "bar ", "baz "] ["fighters", "hoppers", "aldrin"])
    print (zipWith' (*) (replicate 5 2) [1..])
    
    let multCurryFun = zipWith' (*)
    let matrix = [[1..3], [4..6], [7..9]]
    print (zipWith' multCurryFun matrix (reverse matrix))
    
    {-
      [[1,2,3]    *     [7,8,9],
       [4,5,6]    *     [4,5,6],
       [7,8,9]]   *     [1,2,3]]
    =>
      [[zipWith' (*) [1,2,3]  [7,8,9]],
       [zipWith' (*) [4,5,6]  [4,5,6]],
       [zipWith' (*) [7,8,9]  [1,2,3]]]
  
    => zipWith' (curried zipWith' *) matrixA matrixB)
    As `zipWith' (*)` is repesated for all rows, hence it is made as a curried function
    @MIND_BLOWN
    -}
    
    print (flip' zip [1,2,3,4,5] "hello")
    
    print (zipWith (flip' div) [2,2..] [10,8,6,4,2])

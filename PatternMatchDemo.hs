module Main where

-- sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

-- charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"
charName  x  =  "Unknown"

-- addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

addvectorList xs = [a + b | (a, b) <- xs]

-- extract head of a list
head_ele :: [a] -> a
head_ele [] = error "Can't call head on an empty list, dummy!"
head_ele (x:_) = x

tell :: (Show a) => [a] -> String
-- tell [] = error "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

-- recursive calls
myButLast :: [a] -> a
myButLast [] = error "empty list"
myButLast [x] = error "too few elements"
myButLast [x, _] = x
myButLast (x: xs) = myButLast xs

sum' [] = 0
sum' [a] = a
sum' (x:xs) = x + sum' xs

-- @ annotation lets us use the complete pattern elsewhere
capital :: String -> String
capital "" = "Empty string, whoops!"
-- all is annotated and can be used in the expression
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

-- gaurds
-- Note that there's no = right after the function name and its parameters,
-- before the first guard. Many newbies get syntax errors
-- because they sometimes put it there.

bmiTell bmi
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congratulations!"

calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2

bmiCalc weight height
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise                   = "You're a whale, congratulations!"

-- Since we repeat the same expression three times, it would be ideal
-- if we could calculate it once, bind it to a name and then use that name instead
-- of the expression. Well, we can modify our function like this:
bmiCalcBind weight height
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2

bmiCalcBind' weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"
    | otherwise     = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)
          -- skinny = 18.5
          -- normal = 25.0
          -- fat = 30.0

initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname
    
max' :: (Ord a) => a -> a -> a  
max' a b   
    | a > b     = a  
    | otherwise = b  

main :: IO ()
main = do
  print ([sayMe x | x <- [1..6]])
  print ([charName x | x <- ['a'..'d']])
  print (addVectors (1, 2) (2, 3))
  print (addvectorList [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)])

  print (head_ele [1..5])
  print (head_ele [1])
  -- head_ele []

  -- tell []
  print (tell [1])
  print (tell [1..2])
  print (tell [1..5])

  -- recursive calls
  print (sum' [1..3])

  -- @ annotation example
  print (capital "Pavithran")

  print (bmiTell 80)
  print (bmiCalc 85 2)
  print (bmiCalcBind' 50 2)

  print (calcBmis [(85, 2), (50, 2)])

  print (initials "Pavithran" "Ramachandran")

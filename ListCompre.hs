module Main where

-- Note that weeding out lists by predicates is also called filtering.
-- We took a list of numbers and we filtered them by the predicate.
-- Now for another example. Let's say we want a comprehension that
-- replaces each odd number greater than 10 with "BANG!" and each
-- odd number that's less than 10 with "BOOM!". If a number isn't odd,
-- we throw it out of our list. For convenience, we'll put that comprehension
-- inside a function so we can easily reuse it.

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

removeNonLetters str = [ char | char <- str, char `elem` ['a'..'z'] ++ ['A'..'Z']]
filterEvens xxs = [[ x | x <- xs, even x ] | xs <- xxs]

main :: IO ()
main = do
  -- Similar to 1 to 20 in Scala
  let x = [1..20]
  print ([ele * 2 | ele <- x])
  print ([ele * 2 | ele <- x, ele * 2 >= 12])
  print (boomBangs x)

  -- We can include several predicates.
  -- If we wanted all numbers from 10 to 20 that are not 13, 15 or 19, we'd do:
  -- Not equal to in Haskell /= and not !=
  print ([ x | x <- x, x /= 13, x /= 15, x /= 19])

  -- Two lists as input to list comprehension
  -- cartesian combination
  -- similar to for(x <- 1 to 5; y <- 6 to 10) in Scala
  print ([ x*y | x <- [1..5], y <- [6..10]])

  -- Funny example
  let adjectives = ["lazy","grouchy","scheming"]
  let nouns = ["hobo","frog","pope"]
  print ([adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns])

  -- Similar to _ in Scala
  -- Anything operator
  print (sum [1 | _ <- x])

  -- remove non letters characters
  print (removeNonLetters "ABCD1234abcd1234")

  -- double list comprehension
  print (filterEvens [[1..10], [11..20]])

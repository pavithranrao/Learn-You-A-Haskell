module Main where

primes :: [Integer]
primes = primeHelper (2 : [3, 5..])
          where
           primeHelper (p:xs) = p : primeHelper [x | x <- xs, x `mod` p > 0]
 
main :: IO ()   
main = do
  print (take 10 primes)
  print (takeWhile (< 10) primes)

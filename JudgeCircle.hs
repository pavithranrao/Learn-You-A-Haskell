-- https://leetcode.com/problems/judge-route-circle/
module Main where

import Data.List

judgeCircle moves = getEffectiveMoves moves == (0, 0)
-- judgeCircle moves = let
--                       (effHor, effVer) = getEffectiveMoves moves
--                     in effHor == 0 && effVer == 0
getEffectiveMoves moves = foldl (\(accVer, accHor) move ->
                                      case move of
                                        'U' -> (accVer + 1, accHor)
                                        'D' -> (accVer - 1, accHor)
                                        'L' -> (accVer, accHor + 1)
                                        'R' -> (accVer, accHor - 1))
                                (0, 0) moves

main :: IO ()
main = do
  let moves = "RLUURDDDLULL"
  let isCircle = judgeCircle moves
  if isCircle
    then print ("The moves " ++ moves ++ " make a circle")
    else print ("The moves " ++ moves ++ " dont make a circle")

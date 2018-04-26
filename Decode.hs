module Main where

import Data.Char (chr, ord)

convertToStr acc present count = acc ++ replicate count present

-- decodeString input =  foldl (\(acc, count) present ->
--                               if (ord present >= 48) && (ord present <= 57)
--                                 then (acc, count * 10 + ord present - 48)
--                                 else (convertToStr acc present count, 0))
--                         ("", 0) input

decodeString input =  foldl (\(acc, count) present ->
                              if (present >= 48) && (present <= 57)
                                then (acc, count * 10 + present - 48)
                                else (convertToStr acc (chr (present)) count, 0))
                        ("", 0) $ map (ord) input

main :: IO ()
main = do
  let input  = "aaabbcccaa"
  let encode = "3a2b3c2a"
  let (decode, _) = decodeString encode
  
  -- print (ord 'a')
  -- >>> 97
  -- print (chr . ord $ 'a')
  -- >>> 'a'

  print (decode)
  -- >>> "aaabbcccaa"
  -- print (decode == input)
  -- >>> True

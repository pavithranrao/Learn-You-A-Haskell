module Main where

convertToStr acc count prev = concat [acc, (show count), [prev]]

encodeString input = let 
                      (acc, count, prev) = (encodeStringHelper input)
                     in
                      convertToStr acc count prev
                       
                       
encodeStringHelper input = foldl (\(acc, count, prev) present ->
                              if present == prev
                                then (acc, count + 1, prev)
                                else (convertToStr acc count prev, 1, present))
                              ("", 0, head input) input

main :: IO ()
main = do
  let input = "aaabbcccaa"
  let answer = encodeString input
  print (answer)
  -- >>> "3a2b3c2a"

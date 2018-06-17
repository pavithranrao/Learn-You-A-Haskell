module Main where
import Data.List

toString xs
    | null xs   = ""
    | otherwise = show y ++ toString ys
      where
        (y:ys)  = xs

-- Various Implementaions of mkString() function from Scala
mkString' xs sep
    | null xs   = ""
    | otherwise = 
        if null ys
          then show y
        else 
          (show y ++ sep) ++ (mkString' ys sep)
      where
        (y:ys)  = xs

-- @MIND_BLOWN : pattern matching on list
mkString'' xs sep
    | null xs     =  ""
    | ys == []    =  show y
    | otherwise   = (show y ++ sep) ++ (mkString'' ys sep)
      where
        (y:ys) = xs

mkString''' xs sep  = concat  (intersperse sep  (map (show) xs))
mkString    xs sep  = concat . intersperse sep . map show $ xs

main :: IO ()
main = do
    -- intersperse takes an element and a list and then puts that element
    -- in between each pair of elements in the list.
    let xs = [1..3]
    print (toString xs)
    
    print (mkString    xs ", ")
    print (mkString'   xs ", ")
    print (mkString''  xs ", ")
    print (mkString''' xs ", ")

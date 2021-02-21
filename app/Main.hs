module Main where

{- Functor definition
<$> :: Functor f => (a -> b) -> f a -> f b 
where f is a type like Maybe or IO
-}

{- Applicative definition
<*> :: Applicative f => f (a -> b) -> f a -> f b 
where f is a type like Maybe or IO
-}

{- 
min :: Ord a => a -> a -> a
read :: Read a => String -> a
getLine :: IO String
 -}

minOfThree :: Ord a => a -> a -> a -> a
minOfThree val1 val2 val3 = min val1 (min val2 val3)

readInt :: IO Int
readInt = read <$> getLine

minOfInts :: IO Int
minOfInts = minOfThree <$> readInt <*> readInt <*> readInt

main :: IO ()
main = do
  putStrLn "Enter three numbers"
  minInt <- minOfInts
  putStrLn (show minInt ++ " is the smallest")

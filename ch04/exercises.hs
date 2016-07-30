import Data.Char(digitToInt)

sHead :: [a] -> Maybe a
sHead [] = Nothing
sHead (x:_) = Just x

sTail :: [a] -> Maybe [a]
sTail [] = Nothing
sTail (_:xs) = Just xs

sLast :: [a] -> Maybe a
sLast [] = Nothing
sLast [x] = Just x
sLast (_:xs) = sLast xs

sInit :: [a] -> Maybe [a]
sInit [] = Nothing
sInit [_] = Just []
sInit (x:xs) = return (x:) <*> sInit xs

asInt :: Int -> String -> Int
asInt c [] = c
asInt c (x:xs) =
  let newVal = c*10 + digitToInt x
  in asInt newVal xs
-- asInt 0 "42"

asInt' :: String -> Int
asInt' xs = foldl (\s c -> s*10 + digitToInt c) 0 xs
-- asInt "42"

tailSum :: (Num a) => a -> [a] -> a
tailSum c [] = c
tailSum c (x:xs) =
  let newVal = c + x
  in tailSum newVal xs

tailSum' :: (Num a) => [a] -> a
tailSum' xs = foldl (+) 0 xs

-- TODO Chapter 4: "Understanding foldl in terms of foldr"

concatf :: [[a]] -> [a]
concatf [[]] = []
concatf xxs = foldr (\(xs) s -> xs ++ s) [] xxs

tails' :: [a] -> [[a]]
tails' [] = [[]]
tails' whole@(x:xs) = whole : tails' xs

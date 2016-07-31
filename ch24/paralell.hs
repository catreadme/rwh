import Control.Parallel

sort :: (Ord a) => [a] -> [a]
sort [] = []
sort (x:xs) = small ++ x : big
  where small = sort [y | y <- xs, y < x]
        big = sort [y | y <- xs, y >= x]

sort' :: (Ord a) => [a] -> [a]
sort' [] = []
sort' (x:xs) = force big `par` (force small `pseq` (small ++ x:big))

  where small = sort' [y | y <- xs, y < x]
        big = sort' [y | y <- xs, y >= x]

force :: [a] -> ()
force xs = go xs `pseq` ()
  where go (_:xs) = go xs
        go [] = 1

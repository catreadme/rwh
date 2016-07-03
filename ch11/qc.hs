import Test.QuickCheck
import Data.List

prop_idempotent xs = qsort (qsort xs) == qsort xs
-- $> quickCheck (prop_idempotent :: [Integer] -> Bool)
-- $> verboseCheck (prop_idempotent :: [Integer] -> Bool)

qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort lhs ++ [x] ++ qsort rhs
  where lhs = filter (< x) xs
        rhs = filter (>= x) xs

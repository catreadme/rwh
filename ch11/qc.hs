{-# LANGUAGE TemplateHaskell #-}
import Test.QuickCheck
import Test.QuickCheck.All
import Data.List

prop_idempotent xs = qsort (qsort xs) == qsort xs
-- $> quickCheck (prop_idempotent :: [Integer] -> Bool)
-- $> verboseCheck (prop_idempotent :: [Integer] -> Bool)

prop_minimum xs = not (null xs) ==> head (qsort xs) == minimum xs
-- $> quickCheck (prop_minimum :: [Integer] -> Property)
-- $> verboseCheck (prop_minimum :: [Integer] -> Property)

prop_sort_model xs = sort xs == qsort xs
-- $> quickCheck (prop_sort_model :: [Integer] -> Bool)
-- $> verboseCheck (prop_sort_model :: [Integer] -> Bool)

qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort lhs ++ [x] ++ qsort rhs
  where lhs = filter (< x) xs
        rhs = filter (>= x) xs

return []
main = $(quickCheckAll)
-- $> stack exec -- runhaskell qc.hs

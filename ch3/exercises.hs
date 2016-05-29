import Data.List

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

listMean :: (Fractional a) => [a] -> a
listMean [] = 0
listMean list =
  let items = length' list
      total = sum list
  in total / items

toPalin :: [a] -> [a]
toPalin [] = []
toPalin list =
  let rev = reverse list
  in list ++ rev

isPalin :: (Eq a) => [a] -> Bool
isPalin list = list == reverse list

sortByLength :: [[a]] -> [[a]]
sortByLength ls = sortBy (\x y -> compare (length' x) (length' y)) ls

joinLists :: a -> [[a]] -> [a]
joinLists _ [] = []
joinLists _ (x:[]) = x
joinLists s (x:xs) = x ++ [s] ++ joinLists s xs

-- Tree
data Tree a = Node a (Tree a) (Tree a) | Empty
  deriving (Show)

treeHeight :: (Ord b, Num b) => Tree a -> b
treeHeight Empty = 0
treeHeight (Node _ l r) =
  let hl = 1 + treeHeight l
      hr = 1 + treeHeight r
  in max hl hr

tree1 = Node 5 Empty Empty
tree2 = Node 5 Empty (Node 7 Empty Empty)
tree3 = Node 5 (Node 1 Empty (Node 2 Empty Empty)) (Node 7 Empty Empty)

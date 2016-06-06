data Color = Red | Green | Blue
  deriving (Show)

instance Read Color where
  readsPrec _ value =
    tryParse [("Red", Red), ("Green", Green), ("Blue", Blue)]
    where tryParse [] = []
          tryParse ((try, res):xs) =
            if (take (length try) value) == try
              then [(res, drop (length try) value)]
              else tryParse xs

import Test.QuickCheck
import Data.List

data Doc = Empty
         | Char Char
         | Text String
         | Line
         | Concat Doc Doc
         | Union Doc Doc
         deriving (Show, Eq)

instance Arbitrary Doc where
  arbitrary = do
    n <- choose (1,6) :: Gen Int
    case n of
      1 -> return Empty
      2 -> do x <- arbitrary
              return (Char x)
      3 -> do x <- arbitrary
              return (Text x)
      4 -> return Line
      5 -> do x <- arbitrary
              y <- arbitrary
              return (Concat x y)
      6 -> do x <- arbitrary
              y <- arbitrary
              return (Union x y)

-- $> sample (arbitrary::Gen Doc)sample (arbitrary::Gen Doc)

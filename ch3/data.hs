{-
  Basic data types (single value constructor)
-}
data BookInfo = Book Int String [String] deriving (Show)
--   ^ Type     ^ Value
--     Constr.    Constr.

data MagazineInfo = Magazine Int String [String] deriving (Show)
--                           ^   ^      ^
--                           Components

type CustomerId = Int
type ReviewBody = String

data BookReview = BookReview BookInfo CustomerId ReviewBody deriving (Show)


-- Book :: Int -> String -> [String] -> BookInfo
-- Magazine :: Int -> String -> [String] -> MagazineInfo

myBook = Book 1548 "Programming" ["John", "Mary"]
myMag = Magazine 6521 "Haskell Mag" ["Bob", "Tom"]
myRev = BookReview myBook 1 "Nice book"

{-
  Algebraic data types (multiple value constructors)
-}
type CardNumber = Int
type CardHolder = String

data Billing = CreditCard CardNumber CardHolder
             | CashOnDelivery
             | Invoice CustomerId
               deriving (Show)

myBill = CreditCard 142354 "Bob"
myBill' = Invoice 1

{-
  Record syntax (auto accessors)
-}
data Customer = Customer {
    customerId :: CustomerId,
    customerName :: String
  } deriving (Show)

myCust = Customer 2 "Mary"

myCust' = Customer {
    customerName = "John",
    customerId = 3
  }

myCustId = customerId myCust -- 2
--         ^ :: Customer -> CustomerId

myCustName = customerName myCust -- "Mary"
--           ^ :: Customer -> String

{-
  Parameterised data types
-}
data MyMaybe a = MyJust a | MyNothing
  deriving (Show)

myVal = MyJust 'a' -- :: MyMaybe Char
myVal' = MyJust "as" -- :: MyMaybe [Char]
myVal'' = MyNothing -- :: MyNothing

{-
  Recursive data types
-}

-- List
data List a = Cons a (List a) | Nil
  deriving (Show)

myList = Cons 1 (Cons 2 (Cons 3 Nil)) -- Cons 1 (Cons 2 (Cons 3 Nil))
myList' = Nil -- :: Nil

myFirst :: List a -> a
myFirst Nil = error "Empty List"
myFirst (Cons x _) = x

x = myFirst myList -- 1

-- Tree
data Tree a = Node a (Tree a) (Tree a) | Empty
  deriving (Show)

myTree = Node 5 (Node 4 Empty Empty) (Node 7 Empty Empty)

data MTree a = MNode a (Maybe (MTree a)) (Maybe (MTree a))
  deriving (Show)

myMaybeTree = MNode 5 (Just (MNode 5 Nothing Nothing)) (Just (MNode 5 Nothing Nothing))
-- :: MTree Integer

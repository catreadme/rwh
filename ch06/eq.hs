class BasicEq a where
  isEqual :: a -> a -> Bool
  isEqual x y = not $ isEqual x y

  isNotEqual :: a -> a -> Bool
  isNotEqual x y = not $ isEqual x y

instance BasicEq Bool where
  isEqual True True = True
  isEqual False False = True
  isEqual _ _ = False

data Color = Red | Green | Blue
instance BasicEq Color where
  isEqual Red Red = True
  isEqual Green Green = True
  isEqual Blue Blue = True
  isEqual _ _ = False

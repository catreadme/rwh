module Json
  (
    JVal (..)
  , getStr
  , getInt
  , getDouble
  , getBool
  , getObj
  , getArr
  , isNull
  ) where

{-
  JSON Types:
    - String
    - Number
    - Bool
    - Null

  Compount Types:
    - Array
    - Object
-}
data JVal = JStr String
          | JNum Double
          | JBool Bool
          | JNull
          | JObj [(String, JVal)]
          | JArr [JVal]
          deriving (Eq, Ord, Show, Read)

getStr :: JVal -> Maybe String
getStr (JStr x) = Just x
getStr _ = Nothing

getInt :: (Integral a) => JVal -> Maybe a
getInt (JNum x) = Just $ truncate x
getInt _ = Nothing

getDouble :: JVal -> Maybe Double
getDouble (JNum x) = Just x
getDouble _ = Nothing

getBool :: JVal -> Maybe Bool
getBool (JBool x) = Just x
getBool _ = Nothing

getObj :: JVal -> Maybe [(String, JVal)]
getObj (JObj x) = Just x
getObj _ = Nothing

getArr :: JVal -> Maybe [JVal]
getArr (JArr x) = Just x
getArr _ = Nothing

isNull :: JVal -> Bool
isNull JNull = True
isNull _ = False

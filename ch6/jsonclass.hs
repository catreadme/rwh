newtype JsonString = JsonString [Char]
  deriving (Eq, Ord, Show, Read)

newtype JsonObject a = JsonObject [(JsonString, a)]
  deriving (Eq, Ord, Show, Read)

newtype JsonArray a = JsonArray [a]
  deriving (Eq, Ord, Show, Read)

data JVal = JStr JsonString
          | JNum Double
          | JBool Bool
          | JNull
          | JObj (JsonObject JVal)
          | JArr (JsonArray JVal)
          deriving (Eq, Ord, Show, Read)

class Json a where
  toJVal :: a -> JVal
  fromJVal :: JVal -> Either String a

instance Json JsonString where
  toJVal = JStr

  fromJVal (JStr x) = Right x
  fromJVal _ = Left "Not a String"

instance Json Double where
  toJVal = JNum

  fromJVal (JNum x) = Right x
  fromJVal _ = Left "Not a Double"

instance Json Bool where
  toJVal = JBool

  fromJVal (JBool x) = Right x
  fromJVal _ = Left "Not a Bool"

instance (Json a) => Json (JsonArray a) where
  toJVal = undefined
  fromJVal = undefined

instance (Json a) => Json (JsonObject a) where
  toJVal = undefined
  fromJVal = undefined


-- helpers
listToJVals :: (Json a) => [a] -> [JVal]
listToJVals = map toJVal

jValsToJArr :: [JVal] -> JsonArray JVal
jValsToJArr = JsonArray

jArrOfJValsToJVal :: JsonArray JVal -> JVal
jArrOfJValsToJVal = JArr

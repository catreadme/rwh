newtype JsonString = JsonString [Char]
  deriving (Eq, Ord, Show, Read)

data JVal = JStr JsonString
          | JNum Double
          | JBool Bool
          | JNull
          | JObj [(JsonString, JVal)]
          | JArr [JVal]
          deriving (Eq, Ord, Show, Read)

class Json a where
  toJVal :: a -> JVal
  fromJVal :: JVal -> Either String a

instance Json JsonString where
  toJVal x = JStr x

  fromJVal (JStr x) = Right x
  fromJVal _ = Left "Not a String"

instance Json Double where
  toJVal x = JNum x

  fromJVal (JNum x) = Right x
  fromJVal _ = Left "Not a Double"

instance Json Bool where
  toJVal x = JBool x

  fromJVal (JBool x) = Right x
  fromJVal _ = Left "Not a Bool"

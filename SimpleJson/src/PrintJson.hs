module PrintJson where

import Data.List (intercalate)
import SimpleJson

renderJVal :: JVal -> String
renderJVal (JStr x) = show x
renderJVal (JNum x) = show x
renderJVal (JBool True) = "true"
renderJVal (JBool False) = "false"
renderJVal (JNull) = "null"
renderJVal (JObj x) = "{" ++ pairs x ++"}"
  where pairs [] = ""
        pairs xs = intercalate ", " (map renderPair xs)
        renderPair (k,v) = show k ++ ": " ++ renderJVal v
renderJVal (JArr x) = "[" ++ values x ++ "]"
  where values xs = intercalate ", " (map renderJVal xs)

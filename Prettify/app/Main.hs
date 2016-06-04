module Main where

import PrettifyJson
import Prettify
import SimpleJson

json =
  JArr [
    JObj [
      ("name", JStr "Bob"),
      ("age", JNum 25),
      ("skills", JArr [JStr "programming", JStr "skiing"])
    ],
    JObj [
      ("name", JStr "Mary"),
      ("age", JNum 30),
      ("skills", JArr [JStr "diving", JStr "bowling"])
    ],
    JObj [
      ("name", JStr "Jack"),
      ("age", JNum 23),
      ("skills", JArr [JStr "swimming", JStr "cooking"])
    ]
  ]

main = do
  putStrLn "Pretty:"
  putStrLn $ pretty 80 $ renderJVal json
  putChar '\n'
  putStrLn "Compact:"
  putStrLn $ compact $ renderJVal json

module Main where

import SimpleJson
import PrintJson
import PutJson

hJson = (JObj [
          ("name", JStr "Bob"),
          ("age", JNum 25),
          ("skills", JArr [JStr "programming", JStr "skiing"])
        ])

main = putJVal hJson

module PutJson where

import SimpleJson
import PrintJson

putJVal :: JVal -> IO ()
putJVal v = putStrLn (renderJVal v)

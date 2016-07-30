import System.Environment(getArgs)

interactWith :: (String -> String) -> String -> String -> IO ()
interactWith f inFile outFile = do
  x <- readFile inFile
  writeFile outFile (f x)

main :: IO ()
main = mainWith f
  where mainWith f' = do
          args <- getArgs
          case args of
            [inFile, outFile] -> interactWith f' inFile outFile
            _ -> putStrLn "Invalid arguments"
        f = id

-- runhaskell cli.hs cli.hs cli2.hs

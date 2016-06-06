main :: IO ()
main = do
  putStrLn "Enter a Double:"
  doubleStr <- getLine
  let doubleDouble = (read doubleStr) :: Double
  putStrLn $ "Two times " ++ doubleStr ++ " is " ++ show (2*doubleDouble)

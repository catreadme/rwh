reply :: String -> String
reply name =
  "Nice to meet you, " ++ name ++ "\n" ++
  "Your name contains " ++ charcount ++ " chars."
  where charcount = show $ length name

main :: IO ()
main = do
  putStrLn "What's your name?"
  name <- getLine
  putStrLn $ reply name

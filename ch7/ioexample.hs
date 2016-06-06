import System.IO
import System.Directory

main :: IO ()
main = withTempFile "mytemp.txt" myAction

withTempFile :: String -> (FilePath -> Handle -> IO a) -> IO a
withTempFile pattern func =
  do tempdir <- getTemporaryDirectory
     (tempfile, temph) <- openTempFile tempdir pattern

     res <- func tempfile temph

     hClose temph
     removeFile tempfile

     return res

myAction :: FilePath -> Handle -> IO ()
myAction tempname temph =
  do putStrLn "Welcome"
     putStrLn $ "The tempfile is at " ++ tempname

     pos <- hTell temph
     putStrLn $ "The position is " ++ show pos

     let tempdata = show [1..10]
     putStrLn $ "Writing one line containing " ++
                show (length tempdata) ++ " bytes: " ++
                tempdata
     hPutStrLn temph tempdata

     pos' <- hTell temph
     putStrLn $ "After writing, position is " ++ show pos'

     hSeek temph AbsoluteSeek 0
     contents <- hGetContents temph
     putStr $ "Content: " ++  contents

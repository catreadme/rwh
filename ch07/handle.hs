import System.IO
import Data.Char(toUpper)

main :: IO ()
main = do
  inH <- openFile "data/input.txt" ReadMode
  outH <- openFile "data/output.txt" WriteMode
  mainLoop inH outH
  hClose inH
  hClose outH

mainLoop :: Handle -> Handle -> IO ()
mainLoop inh outh =
    do endOfFile <- hIsEOF inh
       if endOfFile
           then return ()
           else do inpStr <- hGetLine inh
                   hPutStrLn outh (map toUpper inpStr)
                   mainLoop inh outh

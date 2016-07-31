import Control.Concurrent (forkIO)
import qualified Data.ByteString.Lazy as L
import Codec.Compression.GZip (compress)

main = do
  putStrLn "Enter file to compress:"
  fileName <- getLine
  content <- L.readFile fileName
  forkIO (L.writeFile (fileName ++ ".gz") . compress $ content)
  putStrLn "Compressing..."

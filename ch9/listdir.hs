import Control.Monad
import System.Directory
import System.FilePath

listRec :: FilePath -> IO [FilePath]
listRec baseDir = do
  names' <- getDirectoryContents baseDir
  let names = filter (`notElem` [".", ".."]) names'
  paths <- forM names $ \name -> do
    let path = baseDir </> name
    isDirectory <- doesDirectoryExist path
    if isDirectory
      then listRec path
      else return [path]
  return $ concat paths

find :: (FilePath -> Bool) -> FilePath -> IO [FilePath]
find f path = do
  names <- listRec path
  return $ filter f names

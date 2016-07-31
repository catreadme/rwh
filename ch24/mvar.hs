import Control.Concurrent

communicate = do
  m <- newEmptyMVar
  forkIO $ do
    v <- takeMVar m
    putStrLn ("got " ++ show v)
  putStrLn "sending"
  putMVar m "wake up!"

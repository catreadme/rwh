import qualified Data.ByteString.Lazy as B

hasElf :: B.ByteString -> Bool
hasElf content = B.take 4 content == elf
  where elf = B.pack [0x7f, 0x45, 0x4c, 0x46]

main = do
  contents <- B.getContents
  let x = show $ hasElf contents
  putStrLn x

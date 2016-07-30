splitLines :: String -> [String]
splitLines [] = []
splitLines xs =
    let (pre, suf) = break isLineTerminator xs
    in pre : case suf of
                ('\r':'\n':rest) -> splitLines rest
                ('\r':rest) -> splitLines rest
                ('\n':rest) -> splitLines rest
                _ -> []

isLineTerminator :: Char -> Bool
isLineTerminator c = c == '\r' || c == '\n'

-- splitLines "those\rare\nmultiple\r\nlines"
-- ["those","are","multiple","lines"]

sHead :: [a] -> Maybe a
sHead [] = Nothing
sHead (x:_) = Just x

sTail :: [a] -> Maybe [a]
sTail [] = Nothing
sTail (_:xs) = Just xs

sLast :: [a] -> Maybe a
sLast [] = Nothing
sLast [x] = Just x
sLast (_:xs) = sLast xs

sInit :: [a] -> Maybe [a]
sInit [] = Nothing
sInit [_] = Just []
sInit (x:xs) = return (x:) <*> sInit xs

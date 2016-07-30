lastButOne :: [a] -> a
lastButOne (x:_:[]) = x
lastButOne (_:xs) = lastButOne (xs)
lastButOne _ = error "List must contain at least 2 elements"

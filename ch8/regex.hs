import Text.Regex.Posix

a = "a usual text of things and text and things" =~ "text" :: Bool
-- True

b = "a usual text of things and text and things" =~ "text" :: Int
-- 2

c = "a usual text of things and text and things" =~ "text" :: String
-- "text"

d = "a usual text of things and text and things" =~ "tex?" :: Bool
-- True

e = "a usual text of things and text and things" =~ "thi*" :: Bool
-- True

f = "pic5.png" =~ "pic[0-9].[pP][nN][gG]" :: String
-- "pic5.png"

-- Exploring some Explicit (or concrete) Types, these begin with uppercase letter 
:t 'a'
-- 'a' :: Char
:t True
-- True :: Bool
:t "HELLO!"
-- "HELLO!" :: String
:t (True, 'a')
-- (True, 'a') :: (Bool, Char)
:t 4 == 5
-- 4 == 5 :: Bool

-- functions also have Explicit Type declarations
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]


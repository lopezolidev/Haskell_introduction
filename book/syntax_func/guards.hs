-- Guards are like if-else statements. They check if a boolean condition evaluates to True or False. 
-- If True, execution follows through what's next the "=" sign
-- If False, goes to the next guard and evaluates condition

bmiTell :: Double -> String -- Num type inference
bmiTell bmi
    | bmi <= 18.5 = "You're underweigth, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise = "You're a whale, congratulations!" -- "else" statement

bmiTell2 :: Double -> Double -> String -- Num type inference
bmiTell2 weight height
    | weight / height ^ 2 <= 18.5 = "You're underweigth, you emo, you!"
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise = "You're a whale, congratulations!" -- "else" statement


myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a == b    = EQ
    | a <= b    = LT 
    | otherwise = GT
-- >>> 101 `myCompare` 99
-- GT

-- 'where' is used to define local identifiers used in the functions definition

bmiTell :: Double -> Double -> String -- Num type inference
bmiTell weight height
    | bmi <= skinny = "You're underweigth, you emo, you!"
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= fat = "You're fat! Lose some weight, fatty!"
    | otherwise = "You're a whale, congratulations!" -- "else" statement
    where 
        bmi    = weight / height ^ 2
        skinny = 18.5
        normal = 25.0
        fat    = 30.0
        -- all the variable names are aligned in a single column, if they're not like this, Haskell will get confused, and it won't 
        -- know that they're part of the same block of code
{-
>>> bmiTell 89 1.81
"You're fat! Lose some weight, fatty!"
-}

-- 'where' 's scope
-- greet :: String -> String
-- greet "Juan" = niceGreeting ++ " Juan!"
-- greet "Fernando" = niceGreeting ++ " Fernando!"
-- greet name = badGreeting ++ " " ++ name
--     where
--         niceGreeting = "Hello! Se very nice to see you,"
--         badGreeting  = "Oh! Pffft. It's you!"
{-
    Variable not in scope: niceGreeting :: [Char]
   |
23 | greet "Juan" = niceGreeting ++ " Juan!"
   |                ^^^^^^^^^^^^

where.hs:24:20: error: [GHC-88464]
    Variable not in scope: niceGreeting :: [Char]
   |
24 | greet "Fernando" = niceGreeting ++ " Fernando!"
   |
-}

-- to put it in the appropiate scope
niceGreeting :: String
niceGreeting = "Hello! Se very nice to see you,"

badGreeting :: String
badGreeting  = "Oh! Pffft. It's you!"

greet :: String -> String
greet "Juan" = niceGreeting ++ " Juan!"
greet "Fernando" = niceGreeting ++ " Fernando!"
greet name = badGreeting ++ " " ++ name

{-
>>> greet "Max"
"Oh! Pffft. It's you! Max"

>>> greet "Juan"
"Hello! Se very nice to see you, Juan!"
-}

-- pattern matching with 'where'
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where
    (f : _) = firstname
    (l : _) = lastname
{-
initials "Xavier" "Lopez"
"X. L."
-}

-- functions in 'where'
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where
        bmi weight height = weight / height ^ 2
{-
>>> calcBmis [(89, 1.98), (60, 1.75), (50, 1.60)]

[22.70176512600755,19.591836734693878,19.531249999999996]
-}
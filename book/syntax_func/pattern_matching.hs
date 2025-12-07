-- pattern matching: patterns that an argument in a function may fit to output a certain result

lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!" -- catchall pattern

sayMe :: Int -> String
sayMe 0 = "Zero!"
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5" -- catchall pattern

-- pattern matching for a mathematical function
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

-- function without a catchcall pattern
charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"

-- pattern matching with tuples
addVector :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVector (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- pattern matching when defining selecting elements from a triple Tuple
firstTuple :: (a, b, c) -> a
firstTuple (x, _, _) = x

secondTuple :: (a, b, c) -> b
secondTuple (_, y, _) = y

thirdTuple :: (a, b, c) -> c
thirdTuple (_, _, z) = z

-- pattern matching with list comprehensions and lists
-- let xs = [(1, 3), (4, 3), (2, 4), (5, 3), (5, 6), (3, 1)]
-- [a + b | (a, b) <- xs] -- if the pattern fails for one element the list will move on to the next element
-- [4,7,6,8,11,4]

head2 :: [a] -> a
head2 [] = error "You can't call a head on an empty list"
head2 (x: _) = x 
{-
head2 [1..]
1
-}

-- pattern matching with a function that takes a list
tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y 
tell (x:y:_) = "This list is too long. The first element is " ++ show x ++ " and the second is " ++ show y 

-- a partial function that only sums lists of 3 elements
badAdd :: (Num a) => [a] -> a
badAdd (x:y:z:[]) = x + y + z 
{- 
>>> badAdd [1..3]
6

>>> badAdd [1..4]
*** Exception: sf_1.hs:63:1-29: Non-exhaustive patterns in function badAdd
-}


-- As-patterns -> it's a way to call a list with something like an alias
firstLetter :: String -> String
firstLetter "" = "Whoops! emtpy string"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
-- firstLetter "Constantinople"
-- "The first letter of Constantinople is C"


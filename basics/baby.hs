doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100
                        then x
                        else x*2
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1
-- in this case the +1 will be added when if statement or the else statement apply.
-- if there're no parenthesis, +1 will only be added on the if statement

conanO'Brien = "It's a-me, Conan O'Brien!"

lostNums = [8, 15, 99, 11, -1, 64, -8]
-- lists are homogenous data structures. Here there're only ints

someNums = [0.78, 9.99, 10, 5, 28]
-- when making a list with ints and floats, all the numbers will be parsed to floats

5:[1, 2, 3, 4, '6']
-- [5,1,2,3,4]

'A':" SMALL CAT"
-- "A SMALL CAT"

'h':'e':'l':'l':'o':[]
-- "hello" ← strings are just lists of characters

"hello" ++ " world"
-- "hello world"

[1, 2, 3, 4, 5] ++ [6]
-- [1,2,3,4,5,6]

let emptyListOfList = [[], [], []]
-- [[],[],[]]

let emptyListOfList = [[], [], [], ['a']]
-- ["","","","a"] ← once a character appears, doesn't throw an error, because an empty list is not a 'null' data type. It just converts everything in emtpy strings

let emptyListOfList = [[], [], [], [0]] 
-- [[],[],[],[0]] ← when a number appears doesn't casts the other lists to integers

"Xavier Lopez" !! 0
-- 'X'

[9.4, 33.2, 96.2, 11.2, 23.25] !! 1
-- 33.2

[9.4, 33.2, 96.2, 11.2, 23.25] !! 10
-- *** Exception: Prelude.!!: index too large


let b = [[1, 2, 3, 4], [5, 3, 3, 3], [1, 2, 2, 3, 4], [1, 2, 3]]
-- [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]

b ++ [[1, 1, 1, 1]]
-- [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3],[1,1,1,1]]

[6, 6, 6] : b
-- [[6,6,6],[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]

b !! 2
-- [1,2,2,3,4]

[3, 2, 1] > [2, 1 ,0]
-- True

[3, 2, 1] > [3, 2 ,4]
-- False

[3, 2, 4] > [3, 2 ,1]
-- True

[3, 2, 1] < [2 , 10 , 100]
-- False

[3, 2, 1] > [2 , 10 , 100]
-- True

[3, 4, 2] < [3, 4, 3]
-- True

[3, 4 ,2] > [2, 4]
-- True

[3, 4, 2] == [3, 4, 2]
-- True

[3, 4, 2] == [3, 4, 1]
-- False

[] > [[]]
-- False

[] < [[]]
-- True

[0] < [[0]]
-- <interactive>:45:2: error: [GHC-39999]

head [5, 4, 3, 2, 1]
-- 5

tail [5, 4, 3, 2, 1]
-- [4,3,2,1]

init [5, 4, 3, 2, 1]
-- [5,4,3,2]

last [5, 4, 3, 2, 1]
-- 1

length [5, 4, 3, 2, 1]
-- 5

null [1, 2, 3]
-- False

null []
-- True

null [[]]
-- False

reverse [1, 2, 3, 4, 5]
-- [5,4,3,2,1]

take 3 [5, 4 , 3 , 2, 1]
-- [5,4,3]

take 1 [5, 4 , 3 , 2, 1]
-- [5]

take 0 [5, 4 , 3 , 2, 1]
-- []

take 6 [5, 4 , 3 , 2, 1]
-- [5,4,3,2,1]

drop 3 [5, 4, 3, 2, 1]
-- [2,1]

drop 6 [5, 4, 3, 2, 1]
-- []

drop 0 [5, 4, 3, 2, 1]
-- [5,4,3,2,1]

drop 100 [1, 2, 3]
-- []

sum [8, 7, 6, 5, 4]
-- 30

product [8, 7, 6, 5, 4]
-- 6720

product [8, 7, 6, 5, 4, 0]
-- 0

elem 2 [1, 2, 3, 4, 5]
-- True

elem 7 [1, 2, 3, 4, 5]
-- False

'a' `elem` ['b', 'c', 'd', 'e']
-- False

'd' `elem` ['b', 'c', 'd', 'e']
-- True

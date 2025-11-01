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

-- Ranges...

take 12 (cycle "hello ")
-- "hello hello "

take 12 (repeat "hello ")
-- ["hello ","hello ","hello ","hello ","hello ","hello ","hello ","hello ","hello ","hello ","hello ","hello "]

replicate 3 "house"
-- ["house","house","house"]

-- the lower limit will increase up until the upper limit, unless that the lower limit is already greater than the upper
[20..1]
-- []

-- reverse list printing
[20,18..1]
-- [20,18,16,14,12,10,8,6,4,2]

-- ascii characters listing
['1'..'z']
-- "123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz"

[1..20]
-- [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

-- all the multiples of 13
[13, 26.. 24 * 13]
-- [13,26,39,52,65,78,91,104,117,130,143,156,169,182,195,208,221,234,247,260,273,286,299,312]

replicate 4 7
-- [7,7,7,7]

-- only will be computed the 24 numbers from the infinite list, and this list is not computed, only declared
take 24 [13, 26..]
-- [13,26,39,52,65,78,91,104,117,130,143,156,169,182,195,208,221,234,247,260,273,286,299,312]

removeLowerCase st = [x | x <- st, x `elem` ['A'..'Z']]
removeLowerCase "SDKABSDKajbasdjkASjkbakjACJKkjACJKACj"
-- "SDKABSDKASACJKACJKAC"

length' xs = sum [1 | _ <- xs]
length' "hello"
-- 5

nouns = ["hobo", "frog", "pope"]
adjectives = ["lazy", "grouchy", "scheming"]
[noun ++ " " ++ adjective | noun <- nouns, adjective <- adjectives]
-- ["hobo lazy","hobo grouchy","hobo scheming","frog lazy","frog grouchy","frog scheming","pope lazy","pope grouchy","pope scheming"]

[x *  y | x <- [5 , 2, 10], y <- [8, 10, 11], x*y > 50]
-- [55,80,100,110]

[x + y | x <- [1 , 2, 3], y <- [10, 100, 1000]]
-- [11,101,1001,12,102,1002,13,103,1003]

boomBang xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
boomBang [5.. 20]
-- ["BOOM!","BOOM!","BOOM!","BANG!","BANG!","BANG!","BANG!","BANG!"]

[x | x <- [10 .. 20], x /= 13, x /= 15, x /= 19]
-- [10,11,12,14,16,17,18,20]

[x * 2 | x <- [1..20], x * 2 >= 12 ] 
-- [12,14,16,18,20,22,24,26,28,30,32,34,36,38,40]


[x * 2 | x <- [50..100], x `mod` 7 == 3 ] 
-- [104,118,132,146,160,174,188]

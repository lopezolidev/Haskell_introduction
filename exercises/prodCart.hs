prodCart :: [a] -> [b] -> [(a,b)]
prodCart _ [] = []
prodCart [] _ = []
prodCart l1 l2 = [(x, y) | x <- l1 , y <- l2]

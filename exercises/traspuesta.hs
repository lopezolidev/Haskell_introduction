entuplarMat :: [[Int]] -> [(Int, Int)]
entuplarMat [] = []
entuplarMat (x:xs) = zip x [0..] ++ entuplarMat xs -- estamos cocatenando dos listas
-- [[1, 2], [3, 4]] -> [(1, 0), (2, 1), (3, 0), (4, 1)]
traspuesta :: [[Int]] -> [[Int]]
traspuesta [[]] = [[]]
traspuesta matriz = [
                     [ x | (x, idx) <- matrizEntuplada, 
                           idx == i]
                         | i <- [0.. maximum (map snd matrizEntuplada)]
                    ]
                    where
                        matrizEntuplada = entuplarMat matriz
-- [[1, 2, 3], [4, 5, 6], [7, 8, 9]] -> [ [1, 4, 7] , [2, 5, 8] , [3, 6, 9]]



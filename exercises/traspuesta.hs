enTuplar :: [Int] -> [(Int, Int)]
enTuplar [] = []
enTuplar lista = zip lista [0..]
-- [1, 2, 3] -> [(1, 0), (2, 1), (3, 2)]

enTuplaLista :: [[Int]] -> [(Int, Int)]
enTuplaLista [] = []
enTuplaLista (x:xs) = enTuplar x ++ enTuplaLista xs -- estamos cocatenando dos listas
-- [[1, 2], [3, 4]] -> [(1, 0), (2, 1), (3, 0), (4, 1)]

traspuesta :: [[Int]] -> [[Int]]
traspuesta [] = []
traspuesta lista = [ 
                   [x | (x, k) <- enTuplaLista lista , k == i] 
                   | i <- [0.. maximum (map snd (enTuplaLista lista))]
                   ]
-- [[1, 2, 3], [4, 5, 6], [7, 8, 9]] -> [ [1, 4, 7] , [2, 5, 8] , [3, 6, 9]]

import System.Process.CommunicationHandle (readCreateProcessWithExitCodeCommunicationHandle)
enTuplar :: [Int] -> [(Int, Int)]
enTuplar [] = []
enTuplar lista = zip lista [0..]

enTuplaLista :: [[Int]] -> [(Int, Int)]
enTuplaLista [] = []
enTuplaLista (x:xs) = enTuplar x ++ enTuplaLista xs

traspuesta :: [[Int]] -> [[Int]]
traspuesta [] = []
traspuesta lista = [
                   [x | (x, k) <- enTuplaLista lista, k == i]
                   | i <- [0.. maximum (map snd (enTuplaLista lista))]
                ]
            
enTuplaMatriz :: [[Int]] -> [[(Int, Int)]]
enTuplaMatriz [] = []
enTuplaMatriz (x:xs) = [enTuplar x] ++ enTuplaMatriz xs

multiplicarMatVec :: [[Int]] -> [Int] -> [Int]
multiplicarMatVec [] _ = error "matriz vacia"
multiplicarMatVec m v = [ sum [x * w | (x, idx) <- filaMat, (w, y) <- vectorEntuplado, idx == y ] 
                         | filaMat <- matrizEntuplada ]
                         where
                            matrizEntuplada = enTuplaMatriz m
                            vectorEntuplado = enTuplar v 

multiplicarMatMat :: [[Int]] -> [[Int]] -> [[Int]]
mutliplicarMatMat _ [] = []
mutliplicarMatMat [] _ = []
multiplicarMatMat m1 m2 = multiplicarMatMat2 m1 m2T
    where
        m2T = traspuesta m2
        multiplicarMatMat2 mA mB 
            | null restoMat = [multiplicarMatVec m1 primerVec]
            | otherwise = multiplicarMatVec mA primerVec : (multiplicarMatMat2 mA restoMat)
            where
                primerVec = head mB
                restoMat  = tail mB

multiplicarMatMatMejorado :: [[Int]] -> [[Int]] -> [[Int]]
multiplicarMatMatMejorado _ [] = []
multiplicarMatMatMejorado [] _ = []
multiplicarMatMatMejorado m1 m2 = traspuesta [multiplicarMatVec m1 col | col <- traspuesta m2]
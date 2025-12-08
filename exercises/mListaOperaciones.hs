mLista :: [Int] -> [[Int]]
mLista [] = []
mLista lista = (operaciones (head lista) lista) : (mLista listaMod)
    where
        listaMod = [x | x <- lista, head lista /= x]
        
        operaciones :: Int ->  [Int] -> [Int]
        operaciones x lista = x : countX : [x*countX]
         where 
             countX = length [y | y <- lista, y == x]
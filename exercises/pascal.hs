siguienteFila :: [Int] -> [Int]
siguienteFila lista = zipWith (+) (0:lista) (lista ++ [0])

pascal :: Int -> [[Int]]
pascal 0 = []
pascal n = take n (iterate siguienteFila [1])

agrupar :: [[Int]] -> [[Int]]
agrupar [] = []
agrupar lista = [
    [x | (x, idx) <- listaMod,
        idx == j
        ] | j <- [0.. minimum (map snd listaSize)]
    ]
    where
        listaMod  = concat [zip x [0..] | x <- lista]
        listaSize = [(x, length x -1) | x <- lista ]
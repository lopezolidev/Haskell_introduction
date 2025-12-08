permutaciones ::(Eq a) =>  [a] -> [[a]]
permutaciones [] = [[]]
permutaciones lista = 
    [
        x : ys 
        | x <- lista,
        ys <- permutaciones (quitarUno x lista)
    ]
    where
        quitarUno :: (Eq a) => a -> [a] -> [a]
        quitarUno _ [] = []
        quitarUno e (x:xs)
            | e == x = xs 
            | otherwise = x : quitarUno e xs 
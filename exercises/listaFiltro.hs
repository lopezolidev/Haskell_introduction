funSinRep :: (Eq a) => [[a]] -> [[a]]
funSinRep [] = []
funSinRep (x:xs) = x : funSinRep (substract x xs)
    where
        substract :: (Eq a) => [a] -> [[a]] -> [[a]]
        substract listaFiltro listasAFiltrar = 
            [
            [ x | x <- sublista,
                notElem x listaFiltro
            ] | sublista <- listasAFiltrar
            ]
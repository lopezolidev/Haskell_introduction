data Arbol a = Hoja a 
             | Nodo a (Arbol a ) (Arbol a )

bfs :: Arbol a -> [a]
bfs raiz = bfsAux [raiz] 

bfsAux :: [Arbol a] -> [a]
bfsAux [] = []
bfsAux (x:xs)
    | esHoja x = [getValue x] ++ bfsAux xs
    | otherwise = [getValue x] ++ bfsAux (xs ++ izq x ++ der x)

esHoja :: Arbol a -> Bool
esHoja (Hoja v) = True
esHoja (Nodo _ _ _) = False


getValue :: Arbol a -> a
getValue (Hoja x) = x 
getValue (Nodo y _ _) = y 

izq :: Arbol a -> [Arbol a]
izq (Nodo _ i _) = [i]
izq (Hoja _) = []

der :: Arbol a -> [Arbol a]
der (Nodo _ _ d) = [d]
der (Hoja _) = []
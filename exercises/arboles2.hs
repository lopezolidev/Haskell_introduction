data Arbol= Hoja Int | Nodo Int Arbol Arbol

heap :: Arbol -> Bool
heap (Hoja v) = True
heap (Nodo a izq der) = a <= getValue izq && a <= getValue der && heap izq && heap der 
    where
        getValue :: Arbol -> Int 
        getValue (Hoja v) = v 
        getValue (Nodo v _ _) = v 
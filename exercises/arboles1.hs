data Arbol a = ArbolVacio -- arbol vacio
             | Nodo a (Arbol a) (Arbol a)
             -- nodo, sub-árbol izquierdo y sub-árbol derecho

mapTree :: (a -> b) -> Arbol a -> Arbol b 
mapTree _ ArbolVacio = ArbolVacio
mapTree go (Nodo x i d) = Nodo (go x) (mapTree go i) (mapTree go d)

foldTree :: (a -> b -> b -> b) -> b -> Arbol a -> b 
foldTree _ v ArbolVacio = v
foldTree go v (Nodo raiz izq der) = go raiz (foldTree go v izq) (foldTree go v der)
operarZyXS :: (Eq a) => a -> [a] -> (Int, [a])
operarZyXS _ [] = (0, [])
operarZyXS z (x:xs) 
      | z == x =       ( cuantosLlevo + 1, listaLimpia )
      | otherwise =    ( cuantosLlevo, x:listaLimpia)
      where
            (cuantosLlevo, listaLimpia) = operarZyXS z xs

-- usando recursión con paso de tuplas

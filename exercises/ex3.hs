operarZyXS :: (Eq a) => a -> [a] -> (Int, [a])
operarZyXS _ [] = (0, [])
operarZyXS z (x:xs) 
      | z == x =       ( cuantosLlevo + 1, listaLimpia )
      | otherwise =    ( cuantosLlevo, x:listaLimpia)
      where
            (cuantosLlevo, listaLimpia) = operarZyXS z xs

-- usando recursión con paso de tuplas

noDoble :: [Char] -> [Char]
noDoble [] = []
noDoble [x] = [x]
noDoble (x:y:xs)
        | x == y = noDoble(x:noDoble xs)
        | otherwise = x:y:noDoble xs
-- solución doblemente recursiva
-- Ineficiente
-- a)apply, que toma una función y un valor, y devuelve el resultado de aplicar la funcion al valor dado 

apply :: (a -> b) -> a -> b
apply f  = f  -- se omite el parámetro, ya que es el mismo izquierda a derecha         

-- b) first, que toma un par ordenado, y devuelve su primera componente.
first :: (a, b) -> a
first (x, _) = x
-- es parcial, no está definida para ()

-- c) sign, la función signo.
sign :: (Num a, Ord a) => a -> Int
sign x
      | x < 0 = -1
      | x > 0 = 1
      |otherwise = 0

-- d) abs, la función valor absoluto (usando sign y sin usarla).
absoluto :: (Num a, Ord a) => a -> a
absoluto x 
    | x < 0 = -x
    | otherwise = x

abs2 :: (Num a , Ord a) => a -> a
abs2 x 
    | sign x >= 0 = x
    | otherwise = -x

-- e) pot, que toma un entero y un número, y devuelve el resultado de elevar el segundo a la potencia dada por el primero.
pot :: (Num a, Ord a) => Int -> a -> a
pot 0 _ = 1
pot x y = y^x
-- solución con el operador de potencia

pot2 :: (Num a) => Int -> a -> a
    pot2 0 _ = 1
    pot2 1 x = x
    pot2 n x 
        | n > 1 = x * pot2 (n-1) x
-- solución con recursividad

-- f) xor, el operador de disyunción exclusiva.
xor :: (Eq a) => a -> a -> Bool
xor x y = x /= y

-- g) max3, que toma tres números enteros y devuelve el máximo entre ellos.
max3 :: Int -> Int -> Int -> Int
max3 a b c = max2 a (max2 b c)
    where
        max2 :: Int -> Int -> Int
        max2 a b
            | a < b = b
            | otherwise = a

-- h) swap, que toma un par y devuelve el par con sus componentes invertidas
swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)
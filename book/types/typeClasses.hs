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

-- Eq type class -> instances can be tested for equality

>>> >>> 5 == 4
-- False

>>> >>> 5 /= 4
-- True

>>> >>> 'a' == 'b'
-- False

>>> 'a' == 'a'
-- True

>>> 3.432 == 3.432
-- True


-- Ord type class -> instances can be ordered

>>> :t (>)
-- (>) :: Ord a => a -> a -> Bool

>>> "Abrakadabra" < "Zebra"
-- True

>>> "Abrakadabra" `compare` "Zebra"
-- LT

>>> 5 >= 2
-- True

>>> 5 `compare` 2
-- GT

>>> 'b' > 'a'
-- True

-- Show type class -> values can be displayed in the console as strings

>>> show 3
-- "3"

>>> show True
-- "True"

>>> show 5 
-- "5"

>>> show (5 + 3)
-- "8"

>>> show "hello"
-- "\"hello\""

>>>show 'h'
-- "'h'"

-- Read type class -> takes a string and returns a value whose type is an instance of Read -> opposite of Show

>>> read "True" || False
-- True

>>> read "8.2" + 3.8
-- 12.0

>>> read "5" - 3
2

>>> read "[1, 2, 3, 4]" ++ [3]
-- [1,2,3,4,3]

>>> read "4"
-- *** Exception: Prelude.read: no parse -> because it doesn't know in which context interpret this "4"

>>> :t read
-- read :: Read a => String -> a
-- takes a string and returns a type a, which is the type of the read itself. Needs context to infer its type

-- we correct this using type annotations
>>> read "5" :: Int -- read this as an Int
-- 5

>>> read "5" :: Float
-- 5.0

>>> (read "5" :: Float) * 4
-- 20.0

>>> read "[1, 2, 3, 4]" :: [Int]
-- [1, 2, 3, 4]

>>> read "(3, 'a')" :: (Int, Char)
-- (3, 'a')


-- Enum type class -> instances can be sequentially ordered types
>>> ['a'..'e']
"abcde"

>>> [LT..GT]

>>> [LT .. GT]
-- [LT,EQ,GT]

>>> [3 .. 5]
-- [3,4,5]

>>> [3.00001 .. 5]
-- [3.00001,4.00001,5.00001]

>>> [3.00001 .. 4.99999]
-- [3.00001,4.00001,5.00001]

>>> succ 'B'
-- 'C'

-- Bounded type class -> instances hace an upper and lower limits

>>>minBound :: Int
-- -9223372036854775808

>>>maxBound :: Int
-- 9223372036854775807

>>>maxBound :: Bool
-- True

>>>minBound :: Int
-- False

>>> maxBound :: Char
-- '\1114111'

>>> minBound :: Char
-- '\NUL'

-- Num type class -> instances can act like numbers
>>> :t 20
-- 20 :: Num a => a -> polymorphic constants

>>> 20 :: Int
-- 20

>>> 20 :: Integer
-- 20

>>> 20 :: Float
-- 20.0

>>> 20 :: Double
-- 20.0

>>> :t (*)
-- (*) :: Num a => a -> a -> a  must return a type of the same of each number

-- an Int and a Float will result in an error
>>> (5 :: Integer) * (6 :: Int)
{-
<interactive>:56:19: error: [GHC-83865]
    • Couldn't match expected type ‘Integer’ with actual type ‘Int’
    • In the second argument of ‘(*)’, namely ‘(6 :: Int)’
      In the expression: (5 :: Integer) * (6 :: Int)
      In an equation for ‘it’: it = (5 :: Integer) * (6 :: Int)
-}

-- but 5 * (6 :: Integer) will work just fine

>>> 5 * (6 :: Integer)
-- 30

-- Integral type class -> instances are ONLY integral numbers, that is only Natural numbers. 
>>> :t fromIntegral
-- fromIntegral :: (Integral a, Num b) => a -> b    takes an integral number and returns a more general number

-- useful when we want floats and intergals types work together

>>> length [1..4] + 3.2 -- error!
{-
<interactive>:59:18: error: [GHC-39999]
    • No instance for ‘Fractional Int’ arising from the literal ‘3.2’
    • In the second argument of ‘(+)’, namely ‘3.2’
      In the expression: length [1 .. 4] + 3.2
      In an equation for ‘it’: it = length [1 .. 4] + 3.2
-}

>>> fromIntegral (length [1..4]) + 3.2
-- 7.2
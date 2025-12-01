miLongitud :: [a] -> Int
miLongitud [] = 0
miLongitud [x] = 1
miLongitud x:xs = contador + 1
         where
         contador = miLongitud xs
-- calcula la longitud de una lista sin usar length

miMultplicación :: [Int] -> Int
miMultiplicación [] = 0 -- ¿Cómo manejar este caso?
miMultiplicación [x] = x 
miMultiplicación x:xs = x*miMultiplicación xs
-- multiplica todos los elementos de una lista

soloPositivos :: [Int] -> [Int]
soloPositivos [] = []
soloPositivos x:xs
             | x > 0 = x:soloPositivos xs
             | otherwise = soloPositivos xs
-- recibe una lista y devuelve otra lista solo con los números mayores a 0

invertir :: [a] -> [a]
invertir [] = []
invertir [x] = x:listaPrevia
invertir x:xs = invertir (xs) : x -- esto no supe hacerlo exactamente
          where
          listaPrevia = invertir xs
        
-- Nivel 1: Anatomía básica, funciones que operan sobre la estructura de la lista
null::[a] -> Bool
null [] = True
null x:xs = False

tail :: [a] -> [a]
tail [] = []
tail x:xs = xs

head :: [a] -> a
head [] = error "lista vacía"
head (x:xs) = x

last :: [a] -> a
last [] = error "Una lista vacía no tiene último elemento"
last [x] = x
last (x:xs) = last xs

init :: [a] -> [a]
init [] = []
init [x] = []
init (x:xs) = x:(init xs)

length :: [a] -> Int
length [] = 0
length (x:xs) = 1 + (length xs)

reverse :: [a] -> [a]
-- versión ineficiente
reverse [] = []
reverse (x:xs) = reverse xs ++ [x]
-- versión eficiente
reverse l = reverse2 l []
         where
         reverse2 :: [a] -> [a] -> [a]
         reverse2 [] temp = temp
         reverse2 (x:xs) [] = reverse2 (x:temp) xs
         
-- Nivel 2: Lógica Booleana y Búsqueda (Reducción a Bool)
-- se debe recorrer la lista y tomar una decisión de Si/No

-- True si todos son True
and :: [Bool] -> Bool
and [] = True
and (x:xs) = x && and xs

-- True si alguno es True
or :: [Bool] -> Bool
or [] = False
or (x:xs) = x || or xs

-- Verifica si alguno cumple la condición 
any :: (a -> Bool) -> [a] -> Bool
any _ [] = False
any f (x:xs) 
      | f x = True
      | otherwise = any f xs
      
-- Verifica si todos cumplen la condición (predicado)
all :: (a -> Bool) -> [a] -> Bool
all _ [] = True
all f (x:xs) 
     | f x = all f xs
     | otherwise = False
    
-- ¿Está el elemento 'x' en la lista?
elem :: (Eq a) => a -> [a] -> Bool
elem _ [] = False
elem x (y:ys)
     | x == y = True
     | otherwise = elem x ys
     
-- ¿No está el elemento 'x' en la lista?
notElem :: (Eq a) => a -> [a] -> Bool
notElem _ [] = True
notElem x (y:ys)
     | x /= y = notElem x ys
     | otherwise = False

-- Nivel 3: Manipulación y sublistas
-- se construyen nuevas listas basadas en contadores o lógica

-- concatenación de listas
(++) :: [a] -> [a] -> [a]
(++) x [] = x
(++) [] y = y
(++) x y = x ++ y

-- concat: aplanar listas
concat :: [[a]] -> [a]
concat [] = []
concat (x:xs) = x ++ (concat xs)

-- take: tomar los primeros n elementos
take :: Int -> [a] -> [a]
take _ [] = []
take 0 xs = xs
take n (x:xs) = x : (take (n-1) xs)

-- drop: borra los primeros n elementos
drop :: Int -> [a] -> [a]
drop _ [] = []
drop 0 xs = xs
drop n (x:xs) = drop (n-1) xs

-- takeWhile: toma elementos mientras se cumpla la condición
takeWhile :: (a -> Bool) -> [a] -> [a] 
takeWhile _ [] = []
takeWhile f (x:xs)
     | f x = x:(takeWhile f xs)
     | otherwise = []
     
-- dropWhile: borra elementos mientras se cumpla la condición
dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile _ [] = []
dropWhile f (x:xs)
     | f x = dropWhile f xs
     | otherwise = x:xs
     
-- splitAt: Parte la lista en dos en la posición n, no supe hacerlo sin
-- función auxiliar
splitAt :: Int -> [a] -> ([a], [a])
splitAt n l = aux n l []
     where
     aux :: Int -> [a] -> [a] -> [a]
     aux 0 (x:xs) tmp = (tmp ++ [x], xs)
     aux n (x:xs) tmp = aux (n-1) xs tmp ++ [x]
     -- no sé si es eficiente
     
-- Nivel 4: Orden Superior
-- funciones que toman funciones

-- map: aplicar una función a c/ elemento
map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = f x : map f xs

-- filter: quedarse solo con lo que cumpla la condición
filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter f (x:xs)
     | f x = x : filter f xs
     | otherwise = filter f xs
     
-- zip: emparejar dos listas en una lista de tuplas
zip :: [a] -> [b] -> [(a, b)]
zip _ [] = []
zip (x:xs) (y:ys) = (x, y) : zip xs ys

-- zipWith: unir dos listas usando una función combinadora
zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith _ _ [] = []
zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys


-- Nivel 5: Plegados
-- foldr: reducción por la derecha
foldr::(a -> b -> b) -> b -> [a] -> b
foldr _ x [] = x
foldr op x (y:ys) = y op (foldr op x ys)

-- foldl: reducción por la izquierda
foldl :: (b -> a -> b) -> b -> [a] -> b
foldl _ z [] = z  -- Caso Base: Devolver el valor final del acumulador 'z'
foldl op z (x:xs) = foldl op (op z x) xs
--                      |   |------| |
--                      |   NUEVO ACUMULADOR:  op z x es el nuevo 'z' para el siguiente paso
--                      RECURSIÓN: Llamar a foldl con el nuevo acumulador y la cola

-- scanr: como foldr pero devuelve los resultados intermedios
scanr :: (a -> b -> b) -> b -> [a] -> [b]
scanr _ z [] = [z] -- ¡Al igual que scanl, el resultado de una lista vacía es [z]!
scanr op z (x:xs) = nuevo_acc : restos
  where
    -- 1. Obtener la lista de resultados intermedios de la cola (restos).
    --    Esta lista es la parte derecha de la expansión.
    restos = scanr op z xs
    
    -- 2. El valor que necesitamos para la cabeza es el primer elemento de 'restos'.
    --    Si restos = [R1, R2, R3, z], R1 es 'b op (c op z)'
    --    Y 'op' se aplica a nuestra cabeza actual 'x' y ese R1.
    R1 = head restos
    
    -- 3. Este es el resultado que se añade al principio.
    nuevo_acc = op x R1
    
    -- 4. El resultado final es pegar el nuevo valor 'nuevo_acc' al inicio de los 'restos'.

-- scanl: como foldl, pero devuelve los resultados intermedios
scanl :: (b -> a -> b) -> b -> [a] -> [b]
scanl _ z [] = [z] 
scanl op z (x:xs) = z : scanl op (op z x) xs


-- Ejercicios de la práctica
-- Escriba una función posiciones que devuelva una lista de índices de las posiciones
-- de un elemento determinado en una lista de elementos. Por ejemplo:
-- E:posiciones 4 [1,4,3,7,4,2]
-- S:[2,5]
-- E:posiciones [3,5] [[3,6],[2,5]]
-- S:[]
posiciones :: (Eq a) => a -> [a] -> [Int]
posiciones y xs = map f 0 y xs
      where
      f :: (Eq b) => Int -> b -> b -> Int
      f accum z w
            | z == w = accum
            | otherwise = accum + 1
           
-- Escriba una función elimDobles, que dada una lista finita, devuelva una nueva lista,
-- con solamente una ocurrencia de cada elemento de la lista original.
elimDobles :: (Eq a) => [a] -> [a]
elimDobles [] = []
elimDobles [x] = [x]
elimDobles xs = elimDobles2 xs []
      where
      elimDobles2 [] _ = []
      elimDobles2 (x:xs) ys
            | not (elem x ys) = x : elimDobles2 xs ys
            | otherwise = elimDobles2 xs ys
            
-- Escriba una función dividir, que dados una lista no decreciente xs y un elemento x,
-- devuelva una tupla de dos listas (ys,zs), con xs = ys ++ zs, donde todos los
-- elementos de ys sean menores o iguales que x, y todos los elementos de zs sean
-- mayores que x.
dividir :: a -> [a] -> ([a],[a])
dividir _ [] = ([], [])
dividir x y:ys
       | y < x = (y : lm, lM)
       | otherwise = (lm, y : lM)
       where
       (lm, lM) = dividir x ys
       
-- Escriba una función insertar, que dados una lista no decreciente ys y un elemento
-- y, devuelva una lista no decreciente igual a ys más el elemento y insertado en el lugar
-- correspondiente.
insertar :: (Ord a) => a -> [a] -> [a]
insertar z [] = [z]
insertar z (x:xs)
      | z < x = z:x:xs
      | otherwise = x:insertar z xs
      
-- Escriba una función unico, que dada una lista devuelva una lista que contenga
-- exactamente los elementos que se encuentran solamente una vez en la lista dada. Por
-- ejemplo:
-- E: unico "Cuales son las letras unicas en esta frase?"
-- S: Coicf?
unico :: [Char] -> [Char]
unico [] = []
unico (x:xs) = unico2 f (x:xs)
     where
     unico2 :: (Char -> [Char] -> Bool) -> [Char] -> [Char]
     unico2 f (x:xs)
          | f x (x:xs) = x : unico2 f xs
          | otherwise = unico2 f xs
          where
          f :: Char -> [Char] -> Bool
          f _ [] = True
          f y (x:xs)
                  | y == x && indice y (x:xs) /= indice x (x:xs) = False
                  | otherwise = f y xs
                  where
                  indice :: a -> [a] -> Int
                  indice _ [] = error "Lista vacía"
                  indice x ys = indice2 x ys 0
                        where
                        indice2 :: a -> [a] -> Int -> Int
                        indice2 _ [] accum = accum
                        incice2 x (y:ys) accum
                             | x == y = accum
                             | otherwise = indice2 x ys (accum + 1)
-- tengo el error de siempre estar comparando hacia adelante
-- tampoco estoy seguro si esta anidación de definiciones entran en la sintaxis

-- Escriba una función multiplicar, que dado un numero positivo m (m < 10), y una
-- lista de números n, (que representa un número), retorne una lista que represente la
-- multiplicación n*m. Ejemplos:
-- E: multiplicar 3 [4,8,9]
-- S: [1,4,6,7]
-- E: multiplicar 5 [9,9,9,1,4,6]
-- S: [4,9,9,5,7,3,0]
multiplicar :: Int -> [Int] -> [Int]
multiplicar _ [] = []
multiplicar _ [0] = [0]
multiplicar n (m:ms) = -- aquí no tengo idea de qué hacer

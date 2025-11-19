-- Int is for integers, is efficient and its bounded, that is, it has a limit
factorial :: Int -> Int
factorial n = product [1..n]
-- factorial 50
-- -3258495067890909184

-- Integer is unbounded and is less efficient than Int, used to store large integers
factorial' :: Integer -> Integer
factorial' n = product [1..n]
-- factorial' 50
-- 30414093201713378043612608166064768844377641568960512000000000000

-- Float is for real floating point numbers with single precision
circumference :: Float -> Float
circumference r = 2 * pi * r
-- circumference 4.0
-- 25.132742

-- Double is for representing real floating point numbers double precision
circumference' :: Double -> Double
circumference' r = 2 * pi * r
-- circumference' 4.0
-- 25.132741228718345

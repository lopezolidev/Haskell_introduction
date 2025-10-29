-- A function that calls itself
-- FACTORIAL
-- factorial n = n * factorial(n - 1)
-- PROGRAM
factorial :: Int -> Int

-- base case
factorial 0 = 1

-- recursive case
factorial n = n * factorial(n - 1)

main = do
  putStrLn "factorial of your number is: "
  print(factorial(5))

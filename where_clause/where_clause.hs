-- WHERE clause is an awesome construct, that helps us to define certain value in our program
popDensity :: (Float, Float) -> Float
popDensity (population, area) = density where density = population / area
main = do
  print(popDensity(110000000, 850.78))

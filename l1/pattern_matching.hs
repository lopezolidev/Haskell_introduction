-- Pattern matching
coffeeType :: String -> String
coffeeType "Espresso" = "Strong and Bold"
coffeeType "Latte" = "Milky and weird!"
coffeeType "Capuccino" = "Frothy and Rich"
coffeeType _ = "Unknown coffeeType"

main = do
    putStrLn "Your coffee description is: "
    print(coffeeType "Espresso")
    print(coffeeType "Latte")
    print(coffeeType "Bread")

-- Your coffee description is: 
-- "Strong and Bold"
-- "Milky and weird!"
-- "Unknown coffeeType"

doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100
                        then x
                        else x*2
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1
-- in this case the +1 will be added when if statement or the else statement apply.
-- if there're no parenthesis, +1 will only be added on the if statement

conanO'Brien = "It's a-me, Conan O'Brien!"

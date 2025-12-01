type Coord = (Int, Int)
data Orientation = H | V deriving (Show, Eq)
type Vehicle = (Orientation, Coord, Int)
-- (Orientación, Coordenada Inicial, Longitud)
type Board = [Vehicle]

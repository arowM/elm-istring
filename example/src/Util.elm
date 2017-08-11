module Util exposing (normalize)

import Char


{-| Filter only digit characters.

    normalize "s"
    --> ""

    normalize "9"
    --> "9"

    normalize "asl20la2"
    --> "202"

-}
normalize : String -> String
normalize =
    String.fromList << List.filter Char.isDigit << String.toList

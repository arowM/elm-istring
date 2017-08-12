module IString
    exposing
        ( IString
        , fromString
        , toString
        , map
        , set
        , lens
        )

{-| A module to handle difficulty of using `Html.Lazy.lazy` with `Html.Events.onInput`.

In particular situation, using `Html.Lazy.lazy` with view that fires `Html.Events.onInput` event does not behave as same as one without `lazy`.
For detail about the situation, please see [package documentation](http://package.elm-lang.org/packages/arowM/elm-istring/latest).

This module provides a `IString` type and related functions to handle the difficulty mentioned above.

# Types

@docs IString

# Constructors

@docs fromString

# Functions to unwrap `IString`

@docs toString

# Operators

@docs map
@docs set

# Lens

@docs lens

-}

import Monocle.Lens exposing (Lens)


-- Types


{-| A main opaque type.

    IString.toString <| IString.fromString "foo"
    --> "foo"

-}
type IString
    = IString String



-- Constructors


{-| A constructor for `IString`.
-}
fromString : String -> IString
fromString str =
    IString str



-- Functions to unwrap `IString`


{-| Pick `String` value out of `IString`.
-}
toString : IString -> String
toString (IString str) =
    str



-- Operators


{-| Modify `IString` value.
-}
map : (String -> String) -> IString -> IString
map f (IString str) =
    IString <| f str


{-| Update `IString`.
-}
set : String -> IString -> IString
set new =
    map (\_ -> new)



-- Lens


{-| A lens value for convenience
-}
lens : Lens IString String
lens =
    Lens toString set

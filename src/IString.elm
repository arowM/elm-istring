module IString
    exposing
        ( IString
        , fromString
        , toString
        , map
        , set
        , lens
        )

{-| A module to handle difficulty of using `Html.Lazy.lazy` with `Html.Attributes.onInput`.

In particular situation, using `Html.Lazy.lazy` with view that fires `Html.Attributes.onInput` event does not behave as same as one without `lazy`.
For detail about the situation, please see our [minimum example]().

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

    val : IString
    val = IString.fromString "foo"

    val2 : IString
    val2 = IString.set "foo" val

    val == val
    --> True

    val /= val2
    --> True

    IString.toString val == IString.toString val2
    --> True

-}
type IString
    = IString Int String



-- Constructors


{-| A constructor for `IString`.
-}
fromString : String -> IString
fromString str =
    IString 0 str



-- Functions to unwrap `IString`


{-| Pick `String` value out of `IString`.
-}
toString : IString -> String
toString (IString _ str) =
    str



-- Operators


{-| Modify `IString` value.
-}
map : (String -> String) -> IString -> IString
map f (IString count str) =
    IString (count + 1) <| f str


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

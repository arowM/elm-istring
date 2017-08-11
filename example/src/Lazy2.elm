module Lazy2 exposing (..)

import Debug
import Html exposing (Html, button, div, input, text)
import Html.Attributes as Html
import Html.Events exposing (onClick, onInput)
import Html.Lazy exposing (lazy)
import IString exposing (IString)
import Util exposing (normalize)


-- App


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- Model


type alias Model =
    { dummy : Int
    , value : IString
    }


init : ( Model, Cmd Msg )
init =
    ( { dummy = 0
      , value = IString.fromString ""
      }
    , Cmd.none
    )



-- Update


type Msg
    = IncDummy
    | UpdateValue String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        IncDummy ->
            ( { model
                | dummy = model.dummy + 1
              }
            , Cmd.none
            )

        UpdateValue str ->
            ( { model
                | value =
                    IString.set (normalize str) model.value
              }
            , Cmd.none
            )



-- View


view : Model -> Html Msg
view model =
    div
        []
        [ button
            [ onClick IncDummy
            ]
            [ text "dummy event"
            ]
        , lazy digitInput model.value
        ]


digitInput : IString -> Html Msg
digitInput v =
    Debug.log "digitInput was called." <|
        input
            [ onInput UpdateValue
            , Html.value <| IString.toString v
            ]
            []



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

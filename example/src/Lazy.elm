module Lazy exposing (..)

import Debug
import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (value)
import Html.Events exposing (onClick, onInput)
import Html.Lazy exposing (lazy)
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
    , value : String
    }


init : ( Model, Cmd Msg )
init =
    ( { dummy = 0
      , value = ""
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
                | value = normalize str
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


digitInput : String -> Html Msg
digitInput str =
    Debug.log "digitInput was called." <|
        input
            [ onInput UpdateValue
            , value str
            ]
            []



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

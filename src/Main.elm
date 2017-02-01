module Main exposing (..)

import Navigation
import Messages exposing (Msg)
import Routing.Routes exposing (Route)
import Routing.Parsers exposing (urlParser)
import Models exposing (State, newState)
import View exposing (view)
import Update exposing (..)


main : Program Never
main =
    Navigation.program urlParser
        { init = init
        , view = view
        , update = update
        , urlUpdate = urlUpdate
        , subscriptions = subscriptions
        }


init : Route -> ( State, Cmd Msg )
init route =
    ( newState route, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : State -> Sub Msg
subscriptions state =
    Sub.none

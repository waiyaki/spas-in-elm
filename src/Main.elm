module Main exposing (..)

import Navigation
import Messages exposing (Msg(..))
import Routing.Routes exposing (Route)
import Routing.Parsers exposing (urlParser)
import Models exposing (State, newState, Post)
import View exposing (view)
import Update exposing (..)
import Http
import Task
import Decoders.Posts exposing (decodePosts)


main : Program Never
main =
    Navigation.program urlParser
        { init = init
        , view = view
        , update = update
        , urlUpdate = urlUpdate
        , subscriptions = subscriptions
        }


fetchPosts : String -> Cmd Msg
fetchPosts url =
    Task.perform FetchFail FetchSucceed (Http.get decodePosts url)


init : Route -> ( State, Cmd Msg )
init route =
    let
        url =
            "http://localhost:3000/api/posts"
    in
        ( newState route, fetchPosts url )



-- SUBSCRIPTIONS


subscriptions : State -> Sub Msg
subscriptions state =
    Sub.none

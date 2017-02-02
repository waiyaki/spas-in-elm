module Update exposing (..)

import Navigation
import Models exposing (State)
import Messages exposing (Msg(..))
import Routing.Routes exposing (..)
import Routing.Routes as Routing
import Tasks exposing (..)


update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    case msg of
        PostReceived post ->
            let
                newState =
                    { state | current = Just post, loading = False }
            in
                ( newState, Cmd.none )

        PostsReceived posts ->
            let
                newState =
                    { state | loading = False, posts = Just posts }
            in
                ( newState, Cmd.none )

        FetchFailed err ->
            let
                newState =
                    { state
                        | loading = False
                        , error = Just "An error occurred while retrieving data"
                    }
            in
                ( newState, Cmd.none )

        ShowHome ->
            ( state, Navigation.newUrl (Routing.reverse HomeRoute) )

        ShowPost postId ->
            let
                postPath =
                    Routing.reverse (PostRoute postId)
            in
                ( state, Navigation.newUrl postPath )


urlUpdate : Route -> State -> ( State, Cmd Msg )
urlUpdate route state =
    case route of
        HomeRoute ->
            let
                newState =
                    { state | posts = Nothing, route = route, loading = True }

                newCmd =
                    fetchPosts
            in
                ( newState, newCmd )

        PostRoute postId ->
            let
                newState =
                    { state | current = Nothing, route = route, loading = True }

                newCmd =
                    fetchPost postId
            in
                ( newState, newCmd )

        _ ->
            ( { state | route = route }, Cmd.none )

module Update exposing (..)

import Navigation
import Models exposing (State, Post, newPost)
import Messages exposing (Msg(..))
import Routing.Routes exposing (..)
import Routing.Routes as Routing
import Tasks exposing (..)
import Ports as Ports


update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    case msg of
        ShowNewPost ->
            let
                newCmd =
                    Navigation.newUrl (Routing.reverse NewPostRoute)
            in
                ( state, newCmd )

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

        UpdatePostTitle title ->
            let
                newPost =
                    updatePostTitle state.current title

                newState =
                    { state | current = newPost }

                newCmd =
                    Ports.save newPost
            in
                ( newState, newCmd )

        UpdatePostBody body ->
            let
                newPost =
                    updatePostBody state.current body

                newState =
                    { state | current = newPost }

                newCmd =
                    Ports.save newPost
            in
                ( newState, newCmd )


updatePostTitle : Maybe Post -> String -> Maybe Post
updatePostTitle maybePost title =
    case maybePost of
        Just post ->
            Just { post | title = title }

        Nothing ->
            Nothing


updatePostBody : Maybe Post -> String -> Maybe Post
updatePostBody maybePost body =
    case maybePost of
        Just post ->
            Just { post | body = body }

        Nothing ->
            Nothing


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

        NewPostRoute ->
            let
                newState =
                    { state | current = Just newPost, route = route }
            in
                ( newState, Cmd.none )

        EditPostRoute postId ->
            let
                newState =
                    { state | current = Nothing, route = route, loading = True }

                newCmd =
                    Ports.get postId
            in
                ( newState, newCmd )

        _ ->
            ( { state | route = route }, Cmd.none )

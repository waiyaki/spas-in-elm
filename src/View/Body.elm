module View.Body exposing (view)

import Html exposing (Html, Attribute, div, a, text)
import Html.Attributes exposing (class, href)
import Routing.Routes exposing (..)
import Post.View as PostView
import View.NotFound as NotFoundView
import Messages exposing (Msg)
import Models exposing (State)


view : State -> Html Msg
view state =
    div [ class "body-wrap" ] [ bodyContent state ]


bodyContent : State -> Html Msg
bodyContent state =
    case state.route of
        HomeRoute ->
            div [] [ text "Home Page" ]

        PostRoute postId ->
            PostView.view postId

        _ ->
            NotFoundView.view

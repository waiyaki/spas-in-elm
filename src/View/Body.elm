module View.Body exposing (view)

import Html exposing (Html, Attribute, div, a, text, ul, li, h2, p, header)
import Html.Attributes exposing (class, href)
import Routing.Routes exposing (..)
import Routing.Routes as Routing
import Post.View.Detail as PostDetail
import Post.View.Edit as PostEdit
import View.NotFound as NotFoundView
import Messages exposing (Msg(..))
import Models exposing (State, Post)
import Common.Html.Util exposing (linkAttrs)


view : State -> Html Msg
view state =
    div [ class "body-wrap" ] [ bodyContent state ]


bodyContent : State -> Html Msg
bodyContent state =
    case state.route of
        HomeRoute ->
            postListView state.posts

        PostRoute postId ->
            PostDetail.view state.current

        NewPostRoute ->
            PostEdit.view Nothing

        EditPostRoute postId ->
            PostEdit.view state.current

        _ ->
            NotFoundView.view


postListView : Maybe (List Post) -> Html Msg
postListView maybePosts =
    case maybePosts of
        Just posts ->
            postList posts

        Nothing ->
            div [ class "empty-results" ] [ text "no articles" ]


postList : List Post -> Html Msg
postList posts =
    ul [ class "post-list" ] (List.map postEntry posts)


postEntry : Post -> Html Msg
postEntry post =
    li [ class "post-entry" ]
        [ a (postLinkAttrs (ShowPost post.id) <| Routing.reverse (PostRoute post.id))
            [ h2 [ class "post-header" ] [ text post.title ]
            , p [ class "post-body" ] [ text post.body ]
            ]
        ]


postLinkAttrs : Msg -> String -> List (Attribute Msg)
postLinkAttrs =
    linkAttrs "post-link"

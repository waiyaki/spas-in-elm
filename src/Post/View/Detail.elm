module Post.View.Detail exposing (view)

import Html exposing (Html, div, text, h2)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import Models exposing (Post)


type alias PostId =
    Int


view : Maybe Post -> Html Msg
view maybePost =
    case maybePost of
        Just post ->
            div [ class "post-content" ]
                [ h2 [ class "post-header" ] [ text post.title ]
                , div [ class "post-author" ] [ text ("by: " ++ post.author) ]
                , div [ class "post-body" ] [ text post.body ]
                ]

        Nothing ->
            div [] [ text "Loading" ]

module Post.View.Edit exposing (view)

import Html exposing (Html, div, input, textarea, text)
import Html.Attributes exposing (class, placeholder, value)
import Html.Events exposing (onInput)
import Messages exposing (..)
import Models exposing (Post)


view : Maybe Post -> Html Msg
view post =
    div [ class "post-editor" ]
        [ input
            [ class "title-input-field"
            , placeholder "Enter title"
            , onInput UpdatePostTitle
            , value (titleValue post)
            ]
            []
        , textarea
            [ class "body-input-field"
            , placeholder "Enter post body"
            , onInput UpdatePostBody
            ]
            (bodyContent post)
        ]


titleValue : Maybe Post -> String
titleValue maybePost =
    case maybePost of
        Just post ->
            post.title

        Nothing ->
            ""


bodyContent : Maybe Post -> List (Html Msg)
bodyContent maybePost =
    case maybePost of
        Just post ->
            [ text post.body ]

        option2 ->
            []

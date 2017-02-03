module View.Header exposing (view)

import Common.Html.Util exposing (linkAttrs)
import Html exposing (Html, Attribute, text, a, header, nav)
import Html.Attributes exposing (class, href)
import Messages exposing (Msg(..))
import Routing.Routes as Routing exposing (..)


view : Html Msg
view =
    header
        [ class "main-header" ]
        [ headerNav ]


headerNav : Html Msg
headerNav =
    let
        homePath =
            Routing.reverse HomeRoute

        newPostPath =
            Routing.reverse NewPostRoute
    in
        nav [ class "header-nav" ]
            [ a (headerLinkAttrs ShowHome homePath) [ text "Home" ]
            , a (headerLinkAttrs ShowNewPost newPostPath) [ text "Create" ]
            ]


headerLinkAttrs : Msg -> String -> List (Attribute Msg)
headerLinkAttrs =
    linkAttrs "nav-link"

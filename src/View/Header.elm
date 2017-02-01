module View.Header exposing (view)

import Common.Html.Util exposing (linkAttrs)
import Html exposing (Html, Attribute, text, a, header)
import Html.Attributes exposing (class, href)
import Messages exposing (Msg(..))
import Routing.Routes as Routing


view : Html Msg
view =
    header
        [ class "main-header" ]
        [ a (headerLinkAttrs ShowHome <| Routing.reverse Routing.HomeRoute) [ text "Home" ]
        ]


headerLinkAttrs : Msg -> String -> List (Attribute Msg)
headerLinkAttrs =
    linkAttrs "nav-link"

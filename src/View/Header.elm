module View.Header exposing (view)

import Common.Events.Util exposing (onClick)
import Html exposing (Html, Attribute, text, a, header)
import Html.Attributes exposing (class, href)
import Messages exposing (Msg(..))


view : Html Msg
view =
    header
        [ class "main-header" ]
        [ a (linkAttrs ShowHome "/") [ text "Home" ]
        ]


linkAttrs : Msg -> String -> List (Attribute Msg)
linkAttrs message link =
    [ onClick message
    , href link
    , class "nav-link"
    ]

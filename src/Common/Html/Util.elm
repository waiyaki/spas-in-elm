module Common.Html.Util exposing (linkAttrs)

import Common.Events.Util exposing (onClick)
import Html exposing (Attribute)
import Html.Attributes exposing (class, href)
import Messages exposing (Msg)


type alias Url =
    String


type alias ClassName =
    String


linkAttrs : ClassName -> Msg -> Url -> List (Attribute Msg)
linkAttrs name message path =
    [ onClick message
    , href path
    , class name
    ]

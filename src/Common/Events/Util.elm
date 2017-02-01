module Common.Events.Util exposing (..)

import Html exposing (Attribute)
import Html.Events exposing (Options, onWithOptions)
import Json.Decode as Json
import Messages exposing (Msg)


onClick : Msg -> Attribute Msg
onClick message =
    onWithOptions "click" noBubble (Json.succeed message)


noBubble : Options
noBubble =
    { stopPropagation = True
    , preventDefault = True
    }

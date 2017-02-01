module Messages exposing (..)

import Models exposing (Post)
import Http


type alias PostId =
    Int


type Msg
    = ShowHome
    | ShowPost PostId
    | FetchSucceed (List Post)
    | FetchFail Http.Error

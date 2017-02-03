module Models exposing (..)

import Routing.Routes exposing (Route)


type alias State =
    { route : Route
    , posts : Maybe (List Post)
    , loading : Bool
    , error : Maybe String
    , current : Maybe Post
    }


type alias Post =
    { id : Int
    , author : String
    , title : String
    , body : String
    }


newState : Route -> Maybe Post -> State
newState route post =
    { route = route
    , posts = Nothing
    , loading = False
    , error = Nothing
    , current = post
    }


newPost : Post
newPost =
    { id = 0
    , author = ""
    , title = ""
    , body = ""
    }

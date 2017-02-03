module Routing.Routes exposing (Route(..), reverse)


type alias PostId =
    Int


type Route
    = HomeRoute
    | PostRoute PostId
    | EditPostRoute PostId
    | NewPostRoute
    | NotFound


reverse : Route -> String
reverse route =
    case route of
        PostRoute postId ->
            "/post/" ++ toString postId

        NewPostRoute ->
            "/post/new"

        EditPostRoute postId ->
            "/post/" ++ (toString postId) ++ "/edit"

        _ ->
            "/"

module Routing.ParserTests exposing (..)

import Navigation
import ElmTest exposing (Test, suite, test, assertEqual, assertNotEqual)
import Routing.Routes exposing (..)
import Routing.Parsers exposing (parse)


tests : Test
tests =
    suite "Routing.Parsers.parse"
        [ test "HomeRoute should match 'index.html'" <|
            assertEqual (parse indexLocation) HomeRoute
        , test "HomeRoute should match an empty path" <|
            assertEqual (parse rootLocation) HomeRoute
        , test "PostRoute should match post/89" <|
            assertEqual (parse postLocation) (PostRoute 89)
        , test "PostRoute should not match wrong id" <|
            assertNotEqual (parse postLocation) (PostRoute 102)
        ]



-- MOCK LOCATIONS


dontCare : String
dontCare =
    "Don't Care"


mockLocation : Navigation.Location
mockLocation =
    { href = dontCare
    , host = dontCare
    , hostname = dontCare
    , protocol = dontCare
    , origin = dontCare
    , port_ = dontCare
    , pathname = dontCare
    , search = dontCare
    , hash = dontCare
    , username = dontCare
    , password = dontCare
    }


indexLocation : Navigation.Location
indexLocation =
    { mockLocation | pathname = "index.html" }


rootLocation : Navigation.Location
rootLocation =
    { mockLocation | pathname = "/" }


postLocation : Navigation.Location
postLocation =
    { mockLocation | pathname = "post/89" }

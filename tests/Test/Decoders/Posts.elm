module Test.Decoders.Posts exposing (tests)

import ElmTest exposing (Test, suite, test, assertEqual)
import Json.Decode as Json
import Decoders.Posts exposing (..)
import Models exposing (Post)


tests : Test
tests =
    suite "Decoders.Posts.decodePost"
        [ test "should return Ok for valid JSON" <|
            assertEqual expectedSuccess <|
                Json.decodeString decodePost validResponse
        , test "should return Error for unexpected JSON" <|
            assertEqual expectedError <|
                Json.decodeString decodePost invalidResponse
        ]


expectedSuccess : Result x Post
expectedSuccess =
    Ok
        { id = 1
        , author = "Test author"
        , title = "Test title"
        , body = "Test body"
        }


expectedError : Result String a
expectedError =
    Err "Expecting an object with a field named `id` but instead got: {}"


validResponse : String
validResponse =
    """
    { "id": 1
    , "author": "Test author"
    , "title": "Test title"
    , "body": "Test body"
    }
    """


invalidResponse : String
invalidResponse =
    "{}"

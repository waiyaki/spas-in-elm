module Main exposing (..)

import ElmTest exposing (Test, suite, test, assertEqual)
import ElmTest


tests : Test
tests =
    suite "Tests"
        [ test "Equality" <|
            assertEqual "test" "test"
        ]


main : Program Never
main =
    ElmTest.runSuite tests

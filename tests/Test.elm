module Test exposing (..)

import ElmTest exposing (Test, suite, test, assertEqual)
import ElmTest
import Routing.RoutesTests as RoutesTests
import Routing.ParserTests as ParserTests


main : Program Never
main =
    ElmTest.runSuite allTests


allTests : Test
allTests =
    suite
        "All Tests"
        [ RoutesTests.tests
        , ParserTests.tests
        ]

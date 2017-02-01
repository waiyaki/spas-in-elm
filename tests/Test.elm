module Test exposing (..)

import ElmTest exposing (Test, suite, test, assertEqual)
import ElmTest
import Test.Routing.Routes as RoutesTests
import Test.Routing.Parsers as ParserTests
import Test.Decoders.Posts as DecoderTests


main : Program Never
main =
    ElmTest.runSuite allTests


allTests : Test
allTests =
    suite
        "All Tests"
        [ RoutesTests.tests
        , ParserTests.tests
        , DecoderTests.tests
        ]

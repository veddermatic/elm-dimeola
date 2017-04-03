module Tests exposing (..)

import Test exposing (..)
import Expect

all : Test
all =
    describe "OMG I am testing"
    [ describe "Unit test examples"
        [ test "Addition" <|
            \() ->
                Expect.equal (3 + 7) 10
        ]
    ]

module Main exposing (..)


import Test exposing (..)
import Test.Runner.Html
import Tests exposing (all)


main : Test.Runner.Html.TestProgram
main =
    [ all
    -- , anotherOne
    ]
        |> concat
        |> Test.Runner.Html.run

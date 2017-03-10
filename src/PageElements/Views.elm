module PageElements.Views exposing (..)

{-
    Static Stuff that is just plain old HTML!
-}


import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg(..))


-- Page Header
pageHeader : Html Msg
pageHeader = 
    header 
        [ class "appHeader" ]
        [ h1
            [ class "appHeader__title" ]
            [ text "Al Di Meola Chord Study Helper" ]
        ]
    
-- Footer
pageFooter : Html Msg
pageFooter =
    footer
        [ class "appFooter" ]
        [ p
            [ class "appFooter__byline" ]
            [ text "created by Dave Vedder" ]
        ]

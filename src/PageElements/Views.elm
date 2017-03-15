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
        [ class "appHeader outerContainer" ]
        [ h1
            [ class "appHeader__title" ]
            [ text "Al Di Meola Chord Study Helper" ]
        ]



-- Footer


pageFooter : Html Msg
pageFooter =
    footer
        [ class "appFooter outerContainer" ]
        [ p
            [ class "appFooter__byline" ]
            [ text "created by "
            , a
                [ href "http://eskimospy.com" ]
                [ text "Dave Vedder" ]
            ]
        , p
            [ class "appFooter__byline" ]
            [ text "made with "
            , a
                [ href "http://elm-lang.org" ]
                [ text "elm" ]
            ]
        , p
            [ class "appFooter__byline" ]
            [ text "source code on "
            , a
                [ href "https://github.com/veddermatic/elm-dimeola" ]
                [ text "github" ]
            ]
        ]

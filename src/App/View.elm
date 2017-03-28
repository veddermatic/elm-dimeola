module App.View exposing (rootView)

import Html exposing (..)
import Html.Attributes exposing (..)

import App.Model exposing (Model)
import App.Messages exposing (..)

import ChordBrowser.View


rootView : Model -> Html Msg
rootView model =
    div [ class "appContainer" ]
        [ pageHeader
        , Html.map BrowserMsg (ChordBrowser.View.rootView model.browser) -- HOLY CRAPi!  Wraps Msg w/o kid knowing nothing about it!
        , pageFooter
        ]


-- Page Header


pageHeader : Html msg
pageHeader =
    header
        [ class "appHeader outerContainer" ]
        [ h1
            [ class "appHeader__title" ]
            [ text "Al Di Meola Chord Study Helper" ]
        ]



-- Footer


pageFooter : Html msg
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

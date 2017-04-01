module App.View exposing (rootView)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Model exposing (Model, Page(..))
import App.Messages exposing (..)
import ChordBrowser.View
import ChordFlashcards.View


rootView : Model -> Html Msg
rootView model =
    div [ class "appContainer" ]
        [ pageHeader
        , navBar
        , viewForPage model
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



-- NAV BAR


navBar : Html msg
navBar =
    nav [ class "appNavigation outerContainer" ]
        [ ul
            [ class "appNavigation__list" ]
            [ li
                [ class "appNavigation__item" ]
                [ a
                    [ href "#browse" ]
                    [ text "Browse Chords" ]
                ]
            , li
                [ class "appNavigation__item" ]
                [ a
                    [ href "#flashcards" ]
                    [ text "Chord Flashcards" ]
                ]
            ]
        ]


viewForPage : Model -> Html Msg
viewForPage model =
    case model.page of
        BrowsePage ->
            Html.map BrowserMsg (ChordBrowser.View.rootView model.browser)

        -- HOLY CRAPi!  Wraps Msg w/o kid knowing nothing about it!
        FlashcardPage ->
            Html.map FlashcardsMsg (ChordFlashcards.View.rootView model.flashcards)



-- HOLY CRAPi!  Wraps Msg w/o kid knowing nothing about it!

module ChordFlashcards.View exposing (rootView)

import Html exposing (Html, div, text, p, button, h1)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import ChordFlashcards.Messages exposing (..)
import ChordFlashcards.Model exposing (..)
import Pickers.Views exposing (multiSelectFormList, multiSelectChordList)
import ChordDiagrams.View exposing (chordDiagram)


rootView : Model -> Html Msg
rootView model =
    div
        [ class "contentPane" ]
        [ div
            [ class "pickerViews" ]
            [ multiSelectChordList ChordToggle model.selectedChords
            , multiSelectFormList FormToggle model.selectedForms
            ]
        , contentView model
        ]


contentView : Model -> Html Msg
contentView model =
    let
        innerView =
            if model.timerRunning then
                cardView model
            else
                instructionsView model
    in
        div
            [ class "flashcardsContent" ]
            [ innerView ]

instructionsCopy : String
instructionsCopy = """
Select the chords and forms you want to study, then hit the 'Start' button.
You'll be shown the chord name and form for five seconds, then the chord 
diagram. Once you've seen all the chords you've picked, you'll see this again.
"""

instructionsView : Model -> Html Msg
instructionsView model =
    let
        disable =
            (List.length model.selectedForms == 0) || (List.length model.selectedChords == 0)
    in
        div
            [ class "flashcardInstructions" ]
            [ h1 
                [ class "flashcardInstructions__header"]
                [ text "Flashcard Training" ]
            , p
                []
                [ text  instructionsCopy ]
            , button
                [ onClick StartTimer
                , class "flashcardInstructions__startButton"
                , disabled disable
                ]
                [ text "Start" ]
            ]


cardView : Model -> Html Msg
cardView model =
    div
        []
        [ cards model
        , button
            [ onClick StopTimer
            , class "flashcardInstructions__stopButton"
            ]
            [ text "Stop" ]
        ]


cards : Model -> Html Msg
cards model =
    div
        [ class "flashcardsHolder" ]
        [ div
            [ classList
                [ ( "flippable", True )
                , ( "flipped", model.cardState /= ChordName )
                ]
            ]
            [ chordInfoView model
            , diagramView model
            ]
        ]


chordInfoView : Model -> Html Msg
chordInfoView model =
    div [ class "flashcards__card flashcards__card--info" ]
        [ p
            [ class "flashcards__chordFormLabel" ]
            [ text (formString model.currentForm) ]
        , p
            [ class "flashcards__chordNameLabel" ]
            [ text (chordString model.currentChord) ]
        ]


diagramView : Model -> Html Msg
diagramView model =
    case ( model.currentForm, model.currentChord ) of
        ( Just form, Just chord ) ->
            div [ class "flashcards__card flashcards__card--diagram" ]
                [ chordDiagram form chord ]

        ( _, _ ) ->
            div [ class "flashcards__card flashcards__card--diagram" ]
                [ text "Cannot Make Diagram" ]


chordString : Maybe String -> String
chordString chord =
    case chord of
        Just c ->
            c

        Nothing ->
            "??"


formString : Maybe String -> String
formString form =
    case form of
        Just f ->
            "Form " ++ f

        Nothing ->
            "??"

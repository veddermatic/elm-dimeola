module ChordBrowser.View exposing (rootView)

import Html exposing (Html, div)
import Html.Attributes exposing (..)

import ChordDiagrams.View exposing (chordDiagram)
--import Pickers.Views as Pickers

import ChordBrowser.Model exposing (..)
import ChordBrowser.Messages exposing (..)

import Pickers.Views exposing (singleSelectFormList, singleSelectChordList)

rootView : Model -> Html Msg
rootView model =
    div
        [ class "contentPane" ]
        [ div
            [ class "pickerViews" ]
            [ singleSelectChordList SelectChord model.selectedChord
            , singleSelectFormList SelectForm model.selectedForm
            ]
        , div
            [ class "chordViewPane" ]
            [ chordDiagram model.selectedForm model.selectedChord ]
        ]

module ChordBrowser.View exposing (rootView)

import Html exposing (Html, div)
import Html.Attributes exposing (..)

import ChordDiagrams.View exposing (chordDiagram)
--import Pickers.Views as Pickers

import ChordBrowser.Model exposing (..)
import ChordBrowser.Messages exposing (..)

import Pickers.Views exposing (pickerViews)

rootView : Model -> Html Msg
rootView model =
    div
        [ class "contentPane" ]
        [ pickerViews (SelectChord, SelectForm)  model.selectedForm model.selectedChord
        , chordDiagram model.selectedForm model.selectedChord 
        ]

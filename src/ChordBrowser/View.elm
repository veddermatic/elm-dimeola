module ChordBrowser.View exposing (rootView)

import Html exposing (Html, div)
import Html.Attributes exposing (..)

import ChordDiagrams.View exposing (chordDiagram)
--import Pickers.Views as Pickers

import ChordBrowser.Model exposing (..)
import ChordBrowser.Messages exposing (..)

rootView : Model -> Html Msg
rootView model =
    div
        [ class "contentPane" ]
        [ chordDiagram model.selectedForm model.selectedChord ]
{-
        [ Pickers.pickerViews model.selectedForm model.selectedChord
        , chordDiagram model.selectedForm model.selectedChord
        ]
-}

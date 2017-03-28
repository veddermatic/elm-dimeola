module Pickers.Views exposing (..)

import Html exposing (Html, text, li, ul, section, h1, div)
import Html.Attributes exposing (..)
import Html.Events exposing (on)
import Json.Decode as Json


-- Gives a list of all the names of all the chords. Well, at least the
-- ones in the book.


chordNames : List String
chordNames =
    [ "Major"
    , "Maj7"
    , "7"
    , "Maj6"
    , "minor"
    , "minor/Maj7"
    , "m7"
    , "m6"
    , "Maj9"
    , "m9"
    , "Maj6/9"
    , "9"
    , "7(b9)"
    , "7(#9)"
    , "o"
    , "7(b5)"
    , "7(#5)"
    , "Maj7(#5)"
    , "Maj7(b5)"
    , "m7(b5)"
    , "7sus4"
    , "m11"
    , "9sus4 / 11"
    , "9(+11)"
    , "13"
    , "13(b9)"
    , "13(#9)"
    ]



-- Gives a list of all ten "forms" describes in the book
-- TODO : move this out of here


chordForms : List String
chordForms =
    [ "I"
    , "II"
    , "III"
      {-
         , "IV"
         , "V"
         , "VI"
         , "VII"
         , "VIII"
         , "IX"
         , "X"
      -}
    ]



-- List of all the musical  notes / keys. Even the wierd ones.
-- TODO : move this out of here


keys : List String
keys =
    [ "Ab"
    , "A"
    , "A♯"
    , "Bb"
    , "B"
    , "B#"
    , "Cb"
    , "C"
    , "C#"
    , "Db"
    , "D"
    , "D#"
    , "Eb"
    , "E"
    , "E#"
    , "Fb"
    , "F"
    , "F#"
    , "Gb"
    , "G"
    , "G#"
    ]



-- ##################
-- custom event handler for clicking that calls a special function to get
-- at the node text
-- onChordSelect : (String -> msg) -> Html.Attribute msg


onChordSelect : (String -> msg) -> Html.Attribute msg
onChordSelect node =
    on "click" (Json.map node grabNodeText)



-- this will be used all over I think!


grabNodeText : Json.Decoder String
grabNodeText =
    Json.at [ "target", "textContent" ] Json.string



-- ##################
-- Display of a single chord name. Note the fancy custom event so
-- I can get the text from the node


chordListItem : (String -> msg) -> String -> String -> Html msg
chordListItem msg selectedChord chord =
    li
        [ onChordSelect msg
        , classList [ ( "chordList__item", True ), ( "chordList__item--selected", (selectedChord == chord) ) ]
        ]
        [ text chord ]


chordListView : (String -> msg) -> String -> Html msg
chordListView msg selectedChord =
    let
        itemMapper =
            chordListItem msg selectedChord

        chords =
            List.map itemMapper chordNames
    in
        section
            [ class "chordList" ]
            [ h1
                [ class "chordList__header contentTitle" ]
                [ text "Chord" ]
            , ul
                [ class "chordList__list" ]
                chords
            ]



-- Display of a single Form Name


formListItem : (String -> msg) -> String -> String -> Html msg
formListItem msg selectedForm form =
    li
        [ onFormSelect msg
        , classList [ ( "formList__item", True ), ( "formList__item--selected", (selectedForm == form) ) ]
        ]
        [ text form ]



-- custom event handler for clicking that calls a special function to get
-- at the node text


onFormSelect : (String -> msg) -> Html.Attribute msg
onFormSelect node =
    on "click" (Json.map node grabNodeText)



-- List of all the Forms


formListView : (String -> msg) -> String -> Html msg
formListView msg selectedForm =
    let
        itemMapper =
            formListItem msg selectedForm

        items =
            List.map itemMapper chordForms
    in
        section
            [ class "formList" ]
            [ h1
                [ class "formList__header contentTitle" ]
                [ text "Form" ]
            , ul
                [ class "formList__list" ]
                items
            ]


pickerViews : ( String -> msg, String -> msg ) -> String -> String -> Html msg
pickerViews msgs selectedForm selectedChord =
    let
        ( chordMsg, formMsg ) =
            msgs
    in
        div
            [ class "pickerViews" ]
            [ chordListView chordMsg selectedChord
            , formListView formMsg selectedForm
            ]

module Pickers.Views
    exposing
        ( singleSelectFormList
        , singleSelectChordList
        , multiSelectFormList
        , multiSelectChordList
        )

import Html exposing (Html, text, li, ul, section, h1, div)
import Html.Attributes exposing (..)
import Html.Events exposing (on)
import Json.Decode as Json
import Pickers.Data exposing (chordForms, chordNames)



grabNodeText : Json.Decoder String
grabNodeText =
    Json.at [ "target", "textContent" ] Json.string


onChordSelect : (String -> msg) -> Html.Attribute msg
onChordSelect node =
    on "click" (Json.map node grabNodeText)



-- Display of a single chord name. Note the fancy custom event so
-- I can get the text from the node
{-
       TODO: compose two versions of this function: one that takes a
       SelectedChords and one that takes a String (like now)

       The itemMapper is the only thing that changes based on input, so
       bust out the HTML bit as a function to reuse and you are good.
   -
-}
-- Display of a single Form Name


formListItem : (String -> msg) -> (String -> Bool) -> String -> Html msg
formListItem msg test form =
    li
        [ onFormSelect msg
        , classList [ ( "formList__item", True ), ( "formList__item--selected", (test form) ) ]
        ]
        [ text form ]


chordListItem : (String -> msg) -> (String -> Bool) -> String -> Html msg
chordListItem msg test chord =
    li
        [ onChordSelect msg
        , classList [ ( "chordList__item", True ), ( "chordList__item--selected", (test chord) ) ]
        ]
        [ text chord ]



-- custom event handler for clicking that calls a special function to get
-- at the node text


onFormSelect : (String -> msg) -> Html.Attribute msg
onFormSelect node =
    on "click" (Json.map node grabNodeText)



-- List of all the Forms


testStr : String -> String -> Bool
testStr a b =
    a == b


testList : List String -> String -> Bool
testList selectedThings testThing =
    flip List.member selectedThings testThing


singleSelectFormList : (String -> msg) -> String -> Html msg
singleSelectFormList msg selectedForm =
    let
        test =
            testStr selectedForm

        itemMapper =
            formListItem msg test

        formItems =
            List.map itemMapper chordForms
    in
        formListView formItems


singleSelectChordList : (String -> msg) -> String -> Html msg
singleSelectChordList msg selectedChord =
    let
        test =
            testStr selectedChord

        mapper =
            chordListItem msg test

        chords =
            List.map mapper chordNames
    in
        chordListView chords


multiSelectFormList : (String -> msg) -> List String -> Html msg
multiSelectFormList msg selectedForms =
    let
        test =
            testList selectedForms

        itemMapper =
            formListItem msg test

        formItems =
            List.map itemMapper chordForms
    in
        formListView formItems


multiSelectChordList : (String -> msg) -> List String -> Html msg
multiSelectChordList msg selectedChords =
    let
        test =
            testList selectedChords

        itemMapper =
            chordListItem msg test

        chords =
            List.map itemMapper chordNames
    in
        chordListView chords


chordListView : List (Html msg) -> Html msg
chordListView chords =
    listView "chord" chords


formListView : List (Html msg) -> Html msg
formListView items =
    listView "form" items


listView : String -> List (Html msg) -> Html msg
listView classSuffix items =
    let
        baseClass =
            classSuffix ++ "List"

        headerClass =
            baseClass ++ "__header contentTitle"

        listClass =
            baseClass ++ "__list"
    in
        section
            [ class baseClass ]
            [ h1
                [ class headerClass ]
                [ text classSuffix ]
            , ul
                [ class listClass ]
                items
            ]

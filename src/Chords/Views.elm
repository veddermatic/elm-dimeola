module Chords.Views exposing (..)

-- external imports
import Html exposing (Html, text, li, ul)
import Html.Events exposing (on)
import Messages exposing (Msg(..))
import Svg 
import Svg.Attributes exposing (..)
import Array
import Json.Decode as Json

-- my imports
import Chords.FormI exposing(formI)
import Chords.FormII exposing(formII)
import Chords.Types exposing(Note, Barre, Fingering(..))


-- CONSTANTS!
diagram_height = 240
diagram_width = 200
num_frets = 4

diagram_inset = 20
diagram_inset_ = toString diagram_inset

string_length = ( diagram_height - (diagram_inset * 2) )
string_length_ = toString string_length

fret_length = ( diagram_width - (diagram_inset * 2) )
fret_length_ = toString fret_length

fret_space =  string_length // num_frets
string_space = fret_length // 5

muteColor = "#d5939b"
rootColor = "#7565b7"

-- Gives a list of all the names of all the chords. Well, at least the
-- ones in the book.
-- TODO : move this out of here
chordList : List String
chordList =
    [ "Major"
    , "Maj7"
    , "7"
    , "Maj6"
    , "minor"
    , "minor/Maj7"
    , "m7"
    , "m6"
    , "Maj9"
    , "Maj6/9"
    , "m9"
    , "9"
    , "o"
    , "7(b9)"
    , "7(#9)"
    , "7(b5)"
    , "7(#5)"
    , "Maj7(b5)"
    , "Maj7(#5)"
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
    {-
    , "III"
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
onChordSelect : (String -> msg) -> Html.Attribute msg
onChordSelect node =
  on "click" (Json.map node grabNodeText)

-- this will be used all over I think!
grabNodeText =
    Json.at ["target", "textContent" ] Json.string


-- ##################


-- Display of a single chord name. Note the fancy custom event so
-- I can get the text from the node
chordListItem : String -> Html Msg
chordListItem chord =
    li [ onChordSelect SelectChord ][ text chord ]


-- List of all the chord names
chordListView : List (Html Msg)
chordListView =
    List.map chordListItem chordList


-- Display of a single Form Name
formListItem : String -> Html Msg
formListItem form =
    li [ onFormSelect SelectForm ][ text form ]


-- custom event handler for clicking that calls a special function to get
-- at the node text
onFormSelect : (String -> msg) -> Html.Attribute msg
onFormSelect node =
  on "click" (Json.map node grabNodeText)


-- List of all the Forms
formListView : List (Html Msg)
formListView =
    List.map formListItem chordForms


-- gets the data to build a chord diagram give the form and name
chordData : String -> String -> List Fingering
chordData chordForm chordName =
    case chordForm of
        "I" ->
            formI chordName
        "II" ->
            formII chordName
        _ ->
            formI chordName


-- DRAW SOME FRETS

-- draws an SVG Path at a given Y position
fret : String -> Html Msg
fret ypos =
    Svg.path [ d ("M" ++ diagram_inset_ ++ " " ++ ypos ++ " h " ++ fret_length_)
             , stroke "#333333"
             , strokeWidth "2"
             ][]

-- factory for getting the Y positions for the fret lines
fretYs : List String
fretYs =
    [0, 1, 2, 3, 4, 5]
        |> List.map (\f -> f * fret_space)
        |> List.map (\s -> toString (s + diagram_inset))


-- draws all the frets for the diagram
frets : List (Html Msg)
frets =
    List.map fret fretYs


-- gets the X positions for a given string. Zero indexed where 0 = low E
stringX : Int -> String
stringX index =
   toString ((index * string_space) + diagram_inset)


-- gets the X position for a barre block
barreX : Int -> String
barreX startString =
    toString ( (startString * string_space) + (diagram_inset // 2) )


-- calculates how wide a barre block should be
barreWidth : Barre -> Int
barreWidth barre =
 (( barre.endString - barre.startString ) * string_space) + diagram_inset


-- gets the Y for a fret
fretY : Int -> String
fretY fret =
    toString ( fret * fret_space )


-- gets the Y for a root block in a Barre
barreRootY : Int -> String
barreRootY fret =
    toString  ( ( fret * fret_space ) - 5 )



-- DRAW SOME STRINGS!

-- Test function that returns if a Fingering is on a given string
hasNote : Int -> Fingering -> Bool
hasNote string fingering =
    case fingering of

        Single note ->
            note.string == string
        
        Barred barre ->
            if (string < barre.startString) then
                False
            else if (string > barre.endString) then
                False
            else
                True

        Ghost note ->
            False


-- Checks to see if a given string has any notes on it in a chord
hasNotes : Int -> List Fingering -> Bool
hasNotes stringNum fingerngs =
    let
        check = hasNote stringNum -- look at me doing curried compsoition!
    in
        List.any check fingerngs


-- Returns a little X in the right spot if a string has no notes, otherwise
-- it returns an empty text node
muteX : Int -> Bool -> Html Msg
muteX stringNum gotNotes =
    let
        xcoord = stringX stringNum
    in
       case gotNotes of

            True ->
                text ""

            False ->
                Svg.text_ 
                [ x xcoord
                , y ( toString (diagram_inset // 2) )
                , dy ( toString (diagram_inset // 4) )
                , fontSize "20"
                , textAnchor "middle"
                , fill muteColor
                ] [ text "x" ]


-- An SVG Path positioned correctly based on string index and colored
-- differently if there are no notes on it.
-- TODO: Put little 'x' above muted. 
renderString : List Fingering -> Int -> Html Msg
renderString stringData index =
    let
        notes = hasNotes index stringData
        strokeColor =
            if (notes) then
                "#333333"
            else
                muteColor
    in
        Svg.g []
        [ Svg.path 
            [ d ("M" ++ (stringX index) ++ " " ++ diagram_inset_ ++ " v " ++ string_length_)
            , stroke strokeColor
            , strokeWidth "2"
            ] []
        , (muteX index notes)
        ]


-- maps over string data and returns a List of SVG Paths of the strings
drawStrings : List Fingering -> List (Html Msg)
drawStrings stringData =
    let
        render = renderString stringData
    in
        List.map render [0, 1, 2, 3, 4, 5]


-- draws a dot or barre block for a given fingering in a chord
drawFingering : Fingering -> Html Msg
drawFingering fingering =
    case fingering of
        Single note ->
            dot note

        Barred barre ->
            barreBlock barre

        Ghost note ->
            ghostDot note


-- Creates a circle with a finger number in it. Will be fancy colored if it
-- is the root note.
dot : Note -> Html Msg
dot note =
    let
        fillColor =
            if note.rootNote then
                "#7565b7"
            else
                "#333333"
        xcoord = ( stringX note.string ) 
        ycoord = fretY note.fret
    in
        Svg.g []
        [ Svg.circle 
            [ cx xcoord
            , cy ycoord
            , r "15"
            , fill fillColor
            ] []
        , Svg.text_ 
            [ x xcoord
            , y ycoord
            , dy "5"
            , fontSize "16"
            , textAnchor "middle"
            , fill "#ffffff"
            ] [ text (toString note.finger) ]
        ]


-- draws a "ghost" note element for chord shapes that lack a root note
ghostDot: Note -> Html Msg
ghostDot note =
    let
        xcoord = ( stringX note.string ) 
        ycoord = fretY note.fret
    in
       Svg.circle 
           [ cx xcoord
           , cy ycoord
           , r "15"
           , stroke "#aaaaaa"
           , strokeWidth "2"
           , fill "none"
           ] []


-- draws a rectangle where your finger barres the string. Hooray.
barreBlock : Barre -> Html Msg
barreBlock barre =
    let
        xcoord = barreX barre.startString
        ycoord = fretY barre.fret
        w_ = barreWidth barre
        h = "10"
        w = toString w_
        labelX = toString (w_ + 2)
    in
        Svg.g []
            [ Svg.rect 
                [ fill "#333333"
                , x xcoord, y ycoord
                , width w, height h
                , rx "0", ry "0" ] []
            , Svg.text_ 
                [ x xcoord
                , y ycoord
                , dy "10"
                , dx labelX 
                , fontSize "14"
                , textAnchor "left"
                , fill "#333"
                ] [ text (toString barre.finger) ]
            , ( barreRootSquare barre.rootString barre.fret )
            ]


-- Draws a block in the barre where the root note is if your barre has the
-- root in it. Otherwise an empty node
barreRootSquare : Maybe Int -> Int -> Html Msg
barreRootSquare string fret =
    case string of
        Nothing ->
            text ""
        Just i ->
            let
                ycoord = barreRootY fret
                xcoord = barreX i
            in
                Svg.rect
                    [ fill rootColor
                    , strokeWidth "6"
                    , stroke "#333333"
                    , y ycoord
                    , x xcoord
                    , height "20"
                    , width "20"
                    ][ ]


-- take the List of StringInfos
-- for each one, return an Svg.g that has dot childrens
drawDots : List Fingering -> List (Html Msg)
drawDots stringData =
    List.map drawFingering stringData


-- Genterate a chord diagram for a given form and chord
chordDiagram : String -> String -> Html Msg
chordDiagram chordForm chordName =
    let
        h = toString diagram_height
        w = toString diagram_width
        theChord = chordData chordForm chordName
    in
        Svg.svg
          [ width w, height h, viewBox ("0 0 " ++ w ++ " " ++ h) ]
          [
            Svg.rect [ fill "#efefef"
                 , stroke "#333333"
                 , strokeWidth "1"
                 , x "0", y "0"
                 , width w, height h
                 , rx "0", ry "0" ] []
            , Svg.g [] frets
            , Svg.g [] (drawStrings theChord)
            , Svg.g [] (drawDots theChord)
          ]

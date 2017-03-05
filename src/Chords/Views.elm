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
import Chords.Types exposing(StringInfo, Note)

-- Gives a list of all the names of all the chords. Well, at least the
-- ones in the book.
chordList : List String
chordList =
    [ "Major"
    , "minor"
    , "Maj7"
    , "7"
    , "Maj9"
    , "m9"
    , "7(b9)"
    , "7(#9)"
    ]


-- Gives a list of all ten "forms" describes in the book
chordForms : List String
chordForms = 
    [ "I"
    , "II"
    , "III"
    , "IV"
    , "V"
    , "VI"
    , "VII"
    , "VIII"
    , "IX"
    , "X"
    ]


-- List of all the musical  notes / keys. Even the wierd ones.
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

-- custom event handler I think... 
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
chordListView : String -> List (Html Msg)
chordListView key  =
    List.map chordListItem chordList



-- gets the data to build a chord diagram give the form and name
chordData : String -> String -> List StringInfo
chordData chordForm chordName =
    case chordForm of
        "I" ->
            formI chordName
        _ ->
            formI chordName


-- DRAW SOME FRETS

-- draws an SVG Path at a given Y position
-- TODO: remove magic number
fret : String -> Html Msg
fret ypos =
    Svg.path [ d ("M20 " ++ ypos ++ " H 180")
             , stroke "#333333"
             , strokeWidth "2"
             ][]

-- draws all the frets for the diagram
-- TODO: remove magic numbers
frets : List (Html Msg)
frets =
    List.map fret ["20", "65", "110", "155", "200"]


-- gets the X positions for a given string. Zero indexed where 0 = low E
-- TODO: remove magic numbers
xpos : Int -> String
xpos index =
   toString ((index * 32) + 20)


-- DRAW SOME STRINGS!

-- An SVG Path positioned correctly based on string index and colored
-- differently if there are no notes on it.
-- TODO: Remove magic numbers. Put little 'x' above muted. 
--       Maybe roll the numbers up as kids here and have a "string" be
--       self-contained and positioned with a transform?
renderString : Int -> StringInfo -> Html Msg
renderString index stringData =
    let
        strokeColor =
            if (List.length stringData.notes) == 0 then
               "#d5939b"
            else
                "#333333"
    in
        Svg.path 
            [ d ("M" ++ (xpos index) ++ " 20 V 200")
            , stroke strokeColor
            , strokeWidth "2"
            ] []


-- maps over string data and returns a List of SVG Paths of the strings
drawStrings : List StringInfo -> List (Html Msg)
drawStrings stringData =
   List.indexedMap renderString stringData


-- Creates a circle with a finger number in it. Will be fancy colored if it
-- is the root note.
-- TODO: Magic numbers. 
dot : Note -> Html Msg
dot note =
    let
        fillColor =
            if note.rootNote then
               "#7565b7"
            else
               "#333333"
        ypos = toString (note.fret * 45)
    in
       Svg.g []
           [ Svg.circle [ cx "0"
                        , cy ypos
                        , r "15"
                        , fill fillColor
                        ] []
           , Svg.text_ [ x "0"
                      , y ypos
                      , dy "5"
                      , fontSize "16"
                      , textAnchor "middle"
                      , fill "#ffffff"
                      ] [ text (toString note.finger) ]
           ]



-- Return an Svg.g that contains the dots for that string.
-- The group is moved to the correct "string" via transform. 
stringDots : Int -> StringInfo -> Html Msg
stringDots index stringInfo =
    let
        x = xpos index
        dots = List.map dot stringInfo.notes
    in
        Svg.g [ transform ("translate(" ++ x ++ ",0)") ] dots 


-- take the List of StringInfos
-- for each one, return an Svg.g that has dot childrens
drawDots : List StringInfo -> List (Html Msg)
drawDots stringData =
    List.indexedMap stringDots stringData


-- Genterate a chord diagram for a given form and chord
-- TODO: magic numbers!
chordDiagram : String -> String -> Html Msg
chordDiagram chordForm chordName =
    let
        h = "240"
        w = "200"
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

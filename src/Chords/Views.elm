module Chords.Views exposing (..)

-- external imports

import Html exposing (Html, text, li, ul, h1, div)
import Messages exposing (Msg(..))
import Svg
import Svg.Attributes exposing (..)


-- my imports

import Chords.FormI exposing (formI)
import Chords.FormII exposing (formII)
import Chords.FormIII exposing (formIII)
import Chords.Types exposing (Note, Barre, Fingering(..))


-- CONSTANTS!


diagram_inset =
    20


diagram_inset_ =
    toString diagram_inset


fret_space =
    45


string_space =
    32



-- string_space = fret_length // 5


num_frets =
    7



-- number of frets diagrams have


num_strings =
    6



-- in case we make a Djent Chord helper! :v:


diagram_height =
    (num_frets * fret_space) + (diagram_inset * 2)


diagram_width =
    ((num_strings - 1) * string_space) + (diagram_inset * 2)


string_length =
    (num_frets * fret_space)


string_length_ =
    toString string_length


fret_length =
    ((num_strings - 1) * string_space)


fret_length_ =
    toString fret_length


fret_stroke =
    "4"


string_stroke =
    "2"


muteColor =
    "#d5939b"


rootColor =
    "#259577"


blackColor =
    "#333333"



-- gets the data to build a chord diagram give the form and name


chordData : String -> String -> List (List Fingering)
chordData chordForm chordName =
    case chordForm of
        "I" ->
            formI chordName

        "II" ->
            formII chordName

        "III" ->
            formIII chordName

        _ ->
            formI chordName



-- DRAW SOME FRETS
-- draws an SVG Path at a given Y position


fret : String -> Html Msg
fret ypos =
    Svg.path
        [ d ("M" ++ diagram_inset_ ++ " " ++ ypos ++ " h " ++ fret_length_)
        , stroke blackColor
        , strokeWidth fret_stroke
        ]
        []



-- factory for getting the Y positions for the fret lines


fretYs : List String
fretYs =
    List.range 0 num_frets
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
    toString ((startString * string_space) + (diagram_inset // 2))



-- calculates how wide a barre block should be


barreWidth : Barre -> Int
barreWidth barre =
    ((barre.endString - barre.startString) * string_space) + diagram_inset



-- gets the Y for a fret


fretY : Int -> String
fretY fret =
    toString (fret * fret_space)



-- gets the Y for a root block in a Barre


barreRootY : Int -> String
barreRootY fret =
    toString ((fret * fret_space) - 5)



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
        check =
            hasNote stringNum

        -- look at me doing curried compsoition!
    in
        List.any check fingerngs



-- Returns a little X in the right spot if a string has no notes, otherwise
-- it returns an empty text node


muteX : Int -> Bool -> Html Msg
muteX stringNum gotNotes =
    let
        xcoord =
            stringX stringNum
    in
        case gotNotes of
            True ->
                text ""

            False ->
                Svg.text_
                    [ x xcoord
                    , y (toString (diagram_inset // 2))
                    , dy (toString (diagram_inset // 4))
                    , fontSize "20"
                    , textAnchor "middle"
                    , fill muteColor
                    ]
                    [ text "x" ]



-- An SVG Path positioned correctly based on string index and colored
-- differently if there are no notes on it.


renderString : List Fingering -> Int -> Html Msg
renderString stringData index =
    let
        notes =
            hasNotes index stringData

        strokeColor =
            if (notes) then
                blackColor
            else
                muteColor
    in
        Svg.g []
            [ Svg.path
                [ d ("M" ++ (stringX index) ++ " " ++ diagram_inset_ ++ " v " ++ string_length_)
                , stroke strokeColor
                , strokeWidth string_stroke
                ]
                []
            , (muteX index notes)
            ]



-- maps over string data and returns a List of SVG Paths of the strings


drawStrings : List Fingering -> List (Html Msg)
drawStrings stringData =
    let
        render =
            renderString stringData
    in
        List.map render (List.range 0 (num_strings - 1))



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
                rootColor
            else
                blackColor

        xcoord =
            (stringX note.string)

        ycoord =
            fretY note.fret
    in
        Svg.g []
            [ Svg.circle
                [ cx xcoord
                , cy ycoord
                , r "15"
                , fill fillColor
                ]
                []
            , Svg.text_
                [ x xcoord
                , y ycoord
                , dy "5"
                , fontSize "16"
                , textAnchor "middle"
                , fill "#ffffff"
                ]
                [ text (toString note.finger) ]
            ]



-- draws a "ghost" note element for chord shapes that lack a root note


ghostDot : Note -> Html Msg
ghostDot note =
    let
        xcoord =
            (stringX note.string)

        ycoord =
            fretY note.fret
    in
        Svg.circle
            [ cx xcoord
            , cy ycoord
            , r "15"
            , stroke "#aaaaaa"
            , strokeWidth "2"
            , fill "none"
            ]
            []



-- draws a rectangle where your finger barres the string. Hooray.


barreBlock : Barre -> Html Msg
barreBlock barre =
    let
        xcoord =
            barreX barre.startString

        ycoord =
            fretY barre.fret

        w_ =
            barreWidth barre

        h =
            "10"

        w =
            toString w_

        labelX =
            toString (w_ + 2)
    in
        Svg.g []
            [ Svg.rect
                [ fill blackColor
                , x xcoord
                , y ycoord
                , width w
                , height h
                , rx "0"
                , ry "0"
                ]
                []
            , Svg.text_
                [ x xcoord
                , y ycoord
                , dy "10"
                , dx labelX
                , fontSize "14"
                , textAnchor "left"
                , fill blackColor
                ]
                [ text (toString barre.finger) ]
            , (barreRootSquare barre.rootString barre.fret)
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
                ycoord =
                    barreRootY fret

                xcoord =
                    barreX i
            in
                Svg.rect
                    [ fill rootColor
                    , strokeWidth "6"
                    , stroke blackColor
                    , y ycoord
                    , x xcoord
                    , height "20"
                    , width "20"
                    ]
                    []



-- take the List of StringInfos
-- for each one, return an Svg.g that has dot childrens


drawDots : List Fingering -> List (Html Msg)
drawDots stringData =
    List.map drawFingering stringData



-- Draws the box diagram for a chord


chordView : Int -> List Fingering -> Html Msg
chordView index theChord =
    let
        h =
            toString diagram_height

        w =
            toString diagram_width

        xcoord =
            toString ((10 + diagram_width) * index)
    in
        Svg.g
            [ transform ("translate(" ++ xcoord ++ ", 0)")
            ]
            [ Svg.rect
                [ fill "#ffffff"
                  {-
                     , stroke blackColor
                     , strokeWidth "1"
                  -}
                , x "0"
                , y "0"
                , width w
                , height h
                , rx "0"
                , ry "0"
                ]
                []
            , Svg.g [] frets
            , Svg.g [] (drawStrings theChord)
            , Svg.g [] (drawDots theChord)
            ]



-- Text showing what chord we are displaying


chordInfo : String -> String -> String
chordInfo chordForm chordName =
    "Form " ++ chordForm ++ " : " ++ chordName



-- Generate a chord diagram(s) for a given form and chord


chordDiagram : String -> String -> Html Msg
chordDiagram chordForm chordName =
    let
        theChords =
            chordData chordForm chordName

        h =
            toString (diagram_height)

        w =
            toString ((diagram_width + 10) * (List.length theChords))
    in
        div
            [ class "chordViewPane" ]
            [ h1
                [ class "currentChord__title contentTitle" ]
                [ text (chordInfo chordForm chordName) ]
              -- , Chords.chordDiagram model.selectedForm model.selectedChord
            , Svg.svg
                [ width w, height h, viewBox ("0 0 " ++ w ++ " " ++ h) ]
                (List.indexedMap chordView theChords)
            ]
